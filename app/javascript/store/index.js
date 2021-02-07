import Vue from 'vue';
import Vuex from 'vuex';
import { home, user, experience, favorite, history, review, search } from "./modules";

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    home,
    user,
    experience,
    favorite,
    history,
    review,
    search,
  },
});
