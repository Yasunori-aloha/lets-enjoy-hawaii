import Vue from 'vue'
import Router from 'vue-router'
import Home from '../views/Home.vue'
import SignInUp from '../views/SignInUp.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    // ホーム画面
    { path: '/', component: Home },
    // 会員登録・ログイン画面
    { path: '/users/sign_up', component: SignInUp },
    { path: '/users/sign_in', component: SignInUp },
  ]
});
