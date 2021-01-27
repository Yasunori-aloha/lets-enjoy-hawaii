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
  },
  getters: {
    mapImageIndex: state => state.mapImageIndex,
    userToken: state => state.user.accessToken,
    userName: state => state.user.name,
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
      await axios.post('http://localhost:3000/api/v1/auth',
      {
        name: signUpForms[0].input,
        email: signUpForms[1].input,
        password: signUpForms[2].input,
        password_confirmation: signUpForms[3].input,
      })
      .then(response => {
        commit('updateUser', { userData: response.data.data, userToken: response.headers });
        localStorage.setItem('id', response.data.data.id);
        localStorage.setItem('name', response.data.data.name);
        localStorage.setItem('email', response.data.data.email);
        localStorage.setItem('introduce', response.data.data.introduce);
        localStorage.setItem('admin', response.data.data.admin);
        localStorage.setItem('access-token', response.headers['access-token']);
        localStorage.setItem('client', response.headers.client);
        localStorage.setItem('uid', response.headers.uid);
      });
    },
    userLogin: async function({ commit }, loginForms) {
      await axios.post('http://localhost:3000/api/v1/auth/sign_in',
      {
        email: loginForms[0].input,
        password: loginForms[1].input,
      })
      .then(response => {
        commit('updateUser', { userData: response.data.data, userToken: response.headers });
        localStorage.setItem('id', response.data.data.id);
        localStorage.setItem('name', response.data.data.name);
        localStorage.setItem('email', response.data.data.email);
        localStorage.setItem('introduce', response.data.data.introduce);
        localStorage.setItem('admin', response.data.data.admin);
        localStorage.setItem('access-token', response.headers['access-token']);
        localStorage.setItem('client', response.headers.client);
        localStorage.setItem('uid', response.headers.uid);
      });
    },
    guestUserLogin: async function({ commit }) {
      await axios.post(
        'http://localhost:3000/api/v1/auth/guest_sign_in',
        ).then(response => {
          commit('updateUser', { userData: response.data.data, userToken: response.headers });
          localStorage.setItem('id', response.data.data.id);
          localStorage.setItem('name', response.data.data.name);
          localStorage.setItem('email', response.data.data.email);
          localStorage.setItem('introduce', response.data.data.introduce);
          localStorage.setItem('admin', response.data.data.admin);
          localStorage.setItem('access-token', response.headers['access-token']);
          localStorage.setItem('client', response.headers.client);
          localStorage.setItem('uid', response.headers.uid);
        });
    },
    logout({ commit }) {
      axios.delete(
        'http://localhost:3000/api/v1/auth/sign_out',
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
  }
});
