import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';
import { csrfToken } from 'rails-ujs';

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken();

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
    updateUserData(state, userData) {
      state.user.id = userData.id;
      state.user.name = userData.name;
      state.user.email = userData.email;
      state.user.introduce = userData.introduce;
      state.user.admin = userData.admin;
    },
    updateUserToken(state, userToken) {
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
    guestUserLogin: async function({ commit }) {
      await axios.post(
        'http://localhost:3000/api/v1/auth/guest_sign_in',
        ).then(response => {
          commit('updateUserData', response.data.data);
          commit('updateUserToken', response.headers);
          localStorage.setItem('id', response.data.data.id);
          localStorage.setItem('name', response.data.data.name);
          localStorage.setItem('email', response.data.data.email);
          localStorage.setItem('introduce', response.data.data.introduce);
          localStorage.setItem('admin', response.data.data.admin);
          localStorage.setItem('access-token', response.headers['access-token']);
          localStorage.setItem('client', response.headers.client);
          localStorage.setItem('uid', response.headers.uid);
        });
    }
  }
});
