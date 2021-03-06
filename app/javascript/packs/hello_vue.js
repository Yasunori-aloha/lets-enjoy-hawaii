import Vue from 'vue';
import Vuex from 'vuex';
import VueRouter from 'vue-router';
import store from '../store/index.js';
import router from '../routes/router.js';
import App from '../app.vue';
import axios from 'axios';
import { csrfToken } from "rails-ujs";
import VueAxios from '../plugins/vue_axios.js';
import VueMq from '../plugins/vue-mq.js'

Vue.use(Vuex);
Vue.use(VueRouter);
Vue.use(VueAxios, { axios: axios, csrfToken: csrfToken });

axios.defaults.baseURL = process.env.API_URL;

document.addEventListener("DOMContentLoaded", () => {
  store.dispatch('autoLogin');
  const app = new Vue({
    store,
    router,
    render: (h) => h(App),
  }).$mount();
  document.body.appendChild(app.$el);
});
