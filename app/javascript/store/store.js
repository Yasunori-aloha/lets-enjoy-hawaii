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
    },
  },
  getters: {
    mapImageIndex: state => state.mapImageIndex
  },
  mutations: {
    updateUser(state, user) {
      state.user.id = user.id;
      state.user.name = user.name;
      state.user.email = user.email;
      state.user.introduce = user.introduce;
      state.user.admin = user.admin;
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
          commit('updateUser', response.data.data);
          console.log(this.state.user);
        });
    }
  }
});
