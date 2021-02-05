import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';
import { home, user, experience, favorite, history } from "./modules";

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    home,
    user,
    experience,
    favorite,
    history,
  },
});
