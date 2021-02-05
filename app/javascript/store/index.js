import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';
import { user, experience, favorite, history } from "./modules";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    mapImageIndex: 8,
  },
  getters: {
    mapImageIndex: state => state.mapImageIndex,
  },
  mutations: {
    // ホーム画面の地図をホバーすると、ホバーした島の表示が変更される。
    mapChange(state, number) {
      state.mapImageIndex = number;
    },
    mapReturn(state, number) {
      state.mapImageIndex = number;
    },
  },
  modules: {
    user,
    experience,
    favorite,
    history,
  },
});
