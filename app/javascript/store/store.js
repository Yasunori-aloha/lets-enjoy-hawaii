import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    mapImageIndex: 8,
    userData: {
      id: null,
      name: null,
      email: null,
      introduce: null,
      admin: null,
      favorites_counts: null,
      reviews_counts: null,
      histories_counts: null,
    },
    userTokens: {
      'access-token': null,
      'client': null,
      'uid': null,
    },
    userReviews: null,
    userFavorites: null,
    userHistories: null,
    experienceData: null,
  },
  getters: {
    mapImageIndex: state => state.mapImageIndex,
    userTokens: state => state.userTokens,
    userData: state => state.userData,
    userReviews: state => state.userReviews,
    userFavorites: state => state.userFavorites,
    userHistories: state => state.userHistories,
    experienceData: state => state.experienceData,
  },
  mutations: {
    updateUserData(state, userData) {
      state.userData.id = userData.id;
      state.userData.name = userData.name;
      state.userData.email = userData.email;
      state.userData.introduce = userData.introduce;
      state.userData.admin = userData.admin;
      state.userData.image_url = userData.image_url;
      state.userData.favorites_counts = userData.favorites_counts;
      state.userData.reviews_counts = userData.reviews_counts;
      state.userData.histories_counts = userData.histories_counts;
    },
    updateUserTokens(state,  userTokens) {
      state.userTokens['access-token'] = userTokens['access-token'];
      state.userTokens['client'] = userTokens['client'];
      state.userTokens['uid'] = userTokens['uid'];
    },
    updateLocalStorage(state, { userData, userTokens }) {
      localStorage.setItem('id', userData.id);
      localStorage.setItem('name', userData.name);
      localStorage.setItem('email', userData.email);
      localStorage.setItem('introduce', userData.introduce);
      localStorage.setItem('admin', userData.admin);
      localStorage.setItem('image_url', userData.image_url);
      localStorage.setItem('access-token', userTokens['access-token']);
      localStorage.setItem('client', userTokens['client']);
      localStorage.setItem('uid', userTokens['uid']);
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
    autoLogin({ commit, dispatch }) {
      const userData = {
        id:  localStorage.getItem('id'),
        name:  localStorage.getItem('name'),
        email:  localStorage.getItem('email'),
        introduce:  localStorage.getItem('introduce'),
        admin:  localStorage.getItem('admin'),
        image_url:  localStorage.getItem('image_url'),
      };
      const userTokens = {
        'access-token':  localStorage.getItem('access-token'),
        'client':  localStorage.getItem('client'),
        'uid':  localStorage.getItem('uid'),
      };
      if (userTokens['access-token']) {
        commit('updateUserData', userData);
        commit('updateUserTokens', userTokens);
      }
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
        commit('updateUserData', response.data);
        commit('updateUserTokens', response.headers);
        commit('updateLocalStorage', { userData: response.data, userTokens: response.headers });
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
        commit('updateUserData', response.data);
        commit('updateUserTokens', response.headers);
        commit('updateLocalStorage', { userData: response.data, userTokens: response.headers });
      });
    },
    guestUserLogin: async function({ commit }) {
      return await axios.post(
        '/api/v1/auth/sign_in',
        {
          guest_user: true,
        })
        .then(response => {
          commit('updateUserData', response.data);
          commit('updateUserTokens', response.headers);
          commit('updateLocalStorage', { userData: response.data, userTokens: response.headers });
        });
    },
    logout: async function({ commit }) {
      await axios.delete(
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
          image_url: null,
          userReviews: null,
          userFavorites: null,
          userHistories: null,
        };
        const userTokens = {
          'access-token': null,
          'client': null,
          'uid': null,
        };
        commit('updateUserData', userData);
        commit('updateUserTokens', userTokens);
        localStorage.removeItem('id');
        localStorage.removeItem('name');
        localStorage.removeItem('email');
        localStorage.removeItem('introduce');
        localStorage.removeItem('admin');
        localStorage.removeItem('image_url');
        localStorage.removeItem('access-token');
        localStorage.removeItem('client');
        localStorage.removeItem('uid');
      });
    },
    toUsersPage: async function({}, userId) {
      await axios.get(`/api/v1/users/${userId}`,
      {
        headers: {
          'access-token': localStorage.getItem('access-token'),
          'client': localStorage.getItem('client'),
          'uid': localStorage.getItem('uid'),
        }
      })
      .then(response => {
        this.state.userData.favorites_counts = response.data.favorites_counts;
        this.state.userData.reviews_counts = response.data.reviews_counts;
        this.state.userData.histories_counts = response.data.histories_counts;
        this.state.userReviews = response.data.reviews;
        this.state.userFavorites = response.data.favorites;
        this.state.userHistories = response.data.histories;
      });
    },
    updateFavoriteComment: async function({}, params) {
      await axios.patch(`/api/v1/users/${params.userId}/favorites/${params.favoriteId}`, params.formData,
      {
        headers: {
          'content-type': 'multipart/form-data',
          'access-token': localStorage.getItem('access-token'),
          'client': localStorage.getItem('client'),
          'uid': localStorage.getItem('uid'),
        }
      })
      .catch(error => {
        console.log(error.response.data);
      });
    },
    removeFavorite: async function({}, params) {
      await axios.delete(`/api/v1/users/${params.userId}/favorites/${params.favoriteId}`,
      {
        headers: {
          'content-type': 'multipart/form-data',
          'access-token': localStorage.getItem('access-token'),
          'client': localStorage.getItem('client'),
          'uid': localStorage.getItem('uid'),
        }
      })
      .catch(error => {
        console.log(error.response.data);
      });
    },
    updateHistoryComment: async function({}, params) {
      await axios.patch(`/api/v1/users/${params.userId}/histories/${params.historyId}`, params.formData,
      {
        headers: {
          'content-type': 'multipart/form-data',
          'access-token': localStorage.getItem('access-token'),
          'client': localStorage.getItem('client'),
          'uid': localStorage.getItem('uid'),
        }
      })
      .catch(error => {
        console.log(error.response.data);
      });
    },
    removeHistory: async function({}, params) {
      await axios.delete(`/api/v1/users/${params.userId}/histories/${params.historyId}`,
      {
        headers: {
          'content-type': 'multipart/form-data',
          'access-token': localStorage.getItem('access-token'),
          'client': localStorage.getItem('client'),
          'uid': localStorage.getItem('uid'),
        }
      })
      .catch(error => {
        console.log(error.response.data);
      });
    },
    updateUserData({ commit }, formData) {
      axios.put('/api/v1/auth', formData,
      {
        headers: {
          'content-type': 'multipart/form-data',
          'access-token': localStorage.getItem('access-token'),
          'client': localStorage.getItem('client'),
          'uid': localStorage.getItem('uid'),
        }
      }
      ).then(response => {
        commit('updateUserData', response.data);
        commit('updateLocalStorage', { userData: response.data, userTokens: this.getters.userTokens });
      });
    },
    toExperiencesPage: async function({}, experienceId) {
      await axios.get(`/api/v1/experiences/${experienceId}`)
      .then(response => {
        this.state.experienceData = response.data;
      });
    },
    favoriteRegistration: async function({}, params) {
      await axios.post(`/api/v1/experiences/${params.experienceId}/histories`,
      {
        headers: {
          'access-token': localStorage.getItem('access-token'),
          'client': localStorage.getItem('client'),
          'uid': localStorage.getItem('uid'),
        },
        user_id: params.userId
      })
      .then(response => {
        this.state.experienceData.already_historied = true;
      });
    },
  }
});
