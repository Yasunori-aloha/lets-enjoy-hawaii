import Vue from 'vue';
import Vuex from 'vuex';
import VueRouter from 'vue-router';
import store from '../store/store.js';
import router from '../routes/router.js';
import App from '../app.vue';
import axios from 'axios';
import { csrfToken } from "rails-ujs";
import VueAxios from '../plugins/vue_axios.js';
import Header from '../components/Header.vue';
import Footer from '../components/Footer.vue';

Vue.use(Vuex);
Vue.use(VueRouter);
Vue.use(VueAxios, { axios: axios, csrfToken: csrfToken });

Vue.component('Header', Header);
Vue.component('Footer', Footer);

document.addEventListener("DOMContentLoaded", () => {
  store.dispatch('autoLogin');
  const app = new Vue({
    store,
    router,
    render: (h) => h(App),
  }).$mount();
  document.body.appendChild(app.$el);
});
