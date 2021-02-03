import Vue from 'vue';
import Router from 'vue-router';
import Vuex from 'vuex';
import store from '../store/store.js';
// ヘッダー・フッター
import Header from '../components/Header.vue';
import Footer from '../components/Footer.vue';
// ホーム画面
import Home from '../views/Home.vue';
// 会員登録・ログインページ
import SignInUp from '../views/SignInUp.vue';
// ユーザーページ
import Users from '../views/Users.vue';
import UsersEdit from '../components/UsersPage/UsersEdit.vue';
import UsersFavorites from '../components/UsersPage/UsersFavorites.vue';
import UsersReviews from '../components/UsersPage/UsersReviews.vue';
import UsersHistories from '../components/UsersPage/UsersHistories.vue';
// アクティビティ詳細ページ
import Experiences from '../views/Experiences.vue';
import ExperiencesMain from '../components/ExperiencesPage/ExperiencesMain.vue';
import ExperiencesReviews from '../components/ExperiencesPage/ExperiencesReviews.vue';
import ExperiencesPhotos from '../components/ExperiencesPage/ExperiencesPhotos.vue';

Vue.use(Router)
Vue.use(Vuex)

export default new Router({
  mode: 'history',
  routes: [
    // ホーム画面
    { path: '/', components: {
        default: Home,
        header: Header,
        footer: Footer,
      }
    },
    // 会員登録・ログイン画面
    { path: '/users/sign_up', component: SignInUp },
    { path: '/users/sign_in', component: SignInUp },
    // マイページ
    { path: '/users/:id', components: {
        default: Users,
        header: Header,
        footer: Footer,
      },
      children: [
        { path: 'edit', component: UsersEdit },
        { path: 'favorites', component: UsersFavorites },
        { path: 'reviews', component: UsersReviews },
        { path: 'histories', component: UsersHistories },
      ],
      // 他人のユーザーページにはアクセスできない。
      beforeEnter: async (to, from, next) => {
        const userId = Number(store.getters.userData.id);
        const userPageId = Number(to.params.id);

        if (/\/users\/\d/.test(to.path)) {
          await store.dispatch('toUsersPage', to.params.id);
        }
        if (userId === userPageId) {
          return next();
        } else {
          return next('/');
        }
      },
    },
    // アクティビティ詳細ページ
    { path: '/experiences/:id',
      components: {
        default: Experiences,
        header: Header,
        footer: Footer,
        main: ExperiencesMain,
      },
      children: [
        { path: 'reviews', component: ExperiencesReviews },
        { path: 'photos', component: ExperiencesPhotos },
      ],
    }
  ]
});
