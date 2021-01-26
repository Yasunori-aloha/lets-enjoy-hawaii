import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';
import { csrfToken } from "rails-ujs";

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
    mapImageIndex: state => state.mapImageIndex
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
    guestUserLogin({ commit }) {
      axios.post(
        'http://localhost:3000/api/v1/auth/guest_sign_in',
        ).then(response => {
          commit('updateUserData', response.data.data, response.headers);
          commit('updateUserToken', response.headers);
          console.log(this.state.user);
        });
    }
  }
});
