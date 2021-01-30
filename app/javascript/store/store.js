import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    mapImageIndex: 8,
    user: {
      id: null,
      name: null,
      email: null,
      introduce: null,
      admin: null,
      accessToken: null,
      client: null,
      uid: null,
    },
    userReviews: null,
    userFavorites: null,
    userHistories: null,
  },
  getters: {
    mapImageIndex: state => state.mapImageIndex,
    userToken: state => state.user.accessToken,
    userData: state => state.user,
    userReviews: state => state.userReviews,
    userFavorites: state => state.userFavorites,
    userHistories: state => state.userHistories,
  },
  mutations: {
    updateUser(state, { userData, userToken}) {
      state.user.id = userData.id;
      state.user.name = userData.name;
      state.user.email = userData.email;
      state.user.introduce = userData.introduce;
      state.user.admin = userData.admin;
      state.user.accessToken = userToken['access-token'];
      state.user.client = userToken.client;
      state.user.uid = userToken.uid;
    },
    updateLocalStorage(state, { userData, userToken }) {
      localStorage.setItem('id', userData.id);
      localStorage.setItem('name', userData.name);
      localStorage.setItem('email', userData.email);
      localStorage.setItem('introduce', userData.introduce);
      localStorage.setItem('admin', userData.admin);
      localStorage.setItem('access-token', userToken['access-token']);
      localStorage.setItem('client', userToken.client);
      localStorage.setItem('uid', userToken.uid);
    },
    // ホーム画面の地図をホバーすると、ホバーした島の表示が変更される。
    mapChange(state, number) {
      state.mapImageIndex = number;
    },
    mapReturn(state, number) {
      state.mapImageIndex = number;
    },
  },
  actions: {
    autoLogin({ commit }) {
      const userData = {
        id:  localStorage.getItem('id'),
        name:  localStorage.getItem('name'),
        email:  localStorage.getItem('email'),
        introduce:  localStorage.getItem('introduce'),
        admin:  localStorage.getItem('admin'),
      };
      const userTokens = {
        'access-token':  localStorage.getItem('access-token'),
        client:  localStorage.getItem('client'),
        uid:  localStorage.getItem('uid'),
      };
      if (!userTokens) return;
      commit('updateUser', { userData: userData, userToken: userTokens })
    },
    userSignUp: async function({ commit }, signUpForms) {
      return await axios.post('/api/v1/auth',
      {
        name: signUpForms[0].input,
        email: signUpForms[1].input,
        password: signUpForms[2].input,
        password_confirmation: signUpForms[3].input,
      })
      .then(response => {
        commit('updateUser', { userData: response.data.data, userToken: response.headers });
        commit('updateLocalStorage', { userData: response.data.data, userToken: response.headers });
      });
    },
    isRegisterd: async function({}, email) {
      return await axios.post('/api/v1/auth/check_email', {
        email: email,
      });
    },
    userLogin: async function({ commit }, loginForms) {
      return await axios.post('/api/v1/auth/sign_in',
      {
        email: loginForms[0].input,
        password: loginForms[1].input,
      })
      .then(response => {
        commit('updateUser', { userData: response.data.data, userToken: response.headers });
        commit('updateLocalStorage', { userData: response.data.data, userToken: response.headers });
      });
    },
    guestUserLogin: async function({ commit }) {
      return await axios.post(
        '/api/v1/auth/guest_sign_in',
        ).then(response => {
          commit('updateUser', { userData: response.data.data, userToken: response.headers });
          commit('updateLocalStorage', { userData: response.data.data, userToken: response.headers });
        });
    },
    logout({ commit }) {
      axios.delete(
        '/api/v1/auth/sign_out',
        {
          headers: {
            'access-token': localStorage.getItem('access-token'),
            'client': localStorage.getItem('client'),
            'uid': localStorage.getItem('uid'),
          }
        }
      )
      .then(response => {
        const userData = {
          id: null,
          name: null,
          email: null,
          introduce: null,
          admin: null,
        };
        const userTokens = {
          'access-token': null,
          client: null,
          uid: null,
        };
        commit('updateUser', { userData: userData, userToken: userTokens });
        localStorage.removeItem('id');
        localStorage.removeItem('name');
        localStorage.removeItem('email');
        localStorage.removeItem('introduce');
        localStorage.removeItem('admin');
        localStorage.removeItem('access-token');
        localStorage.removeItem('client');
        localStorage.removeItem('uid');
      });
    },
    toUsersPage: async function({}, userId) {
      await axios.get(`/api/v1/users/${userId}`)
      .then(response => {
        this.state.userReviews = response.data.data.relationships.reviews.data;
        this.state.userFavorites = response.data.data.relationships.favorites.data;
        this.state.userHistories = response.data.data.relationships.histories.data;
      });
    },
  }
});
