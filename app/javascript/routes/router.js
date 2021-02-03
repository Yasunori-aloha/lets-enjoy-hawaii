import Vue from 'vue'
import Router from 'vue-router'
import Vuex from 'vuex'
import store from '../store/store.js'
import Home from '../views/Home.vue'
import SignInUp from '../views/SignInUp.vue'
import Users from '../views/Users.vue'
import UsersEdit from '../components/UsersPage/UsersEdit.vue'
import UsersFavorites from '../components/UsersPage/UsersFavorites.vue'
import UsersReviews from '../components/UsersPage/UsersReviews.vue'
import UsersHistories from '../components/UsersPage/UsersHistories.vue'

Vue.use(Router)
Vue.use(Vuex)

export default new Router({
  mode: 'history',
  routes: [
    // ホーム画面
    { path: '/', component: Home },
    // 会員登録・ログイン画面
    { path: '/users/sign_up', component: SignInUp },
    { path: '/users/sign_in', component: SignInUp },
    // マイページ
    { path: '/users/:id', component: Users,
      children: [
        { path: 'edit', component: UsersEdit },
        { path: 'favorites', component: UsersFavorites },
        { path: 'reviews', component: UsersReviews },
        { path: 'histories', component: UsersHistories },
      ],
    },
  ]
});
