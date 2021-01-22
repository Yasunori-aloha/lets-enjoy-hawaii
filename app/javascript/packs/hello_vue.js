import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
import router from '../router.js'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    router,
    render: h => h(App)
  }).$mount("#app");
})
