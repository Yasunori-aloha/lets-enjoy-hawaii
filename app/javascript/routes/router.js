import Vue from 'vue';
import Router from 'vue-router';
import Vuex from 'vuex';
import store from '../store/index.js';
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
import Reviews from '../components/ExperiencesPage/Reviews.vue';
import Photos from '../components/ExperiencesPage/Photos.vue';
// 口コミ投稿ページ
import ReviewCreate from '../views/ReviewCreate.vue';
// アクティビティ検索結果ページ
import Search from '../views/Search.vue';
// ホーム画面からの遷移歴表示欄
import PageMenu from '../components/PageMenu.vue';

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
        pageMenu: PageMenu,
        footer: Footer,
      },
      children: [
        { path: 'reviews', component: Reviews },
        { path: 'photos', component: Photos },
      ],
      beforeEnter: async (to, from, next) => {
        await store.dispatch('toExperiencesPage', to.params.id);
        store.commit('resetSort');
        return next();
      },
    },
    // 口コミ投稿ページ
    { path: '/experience/review',
      components: {
        default: ReviewCreate,
        header: Header,
        footer: Footer,
      },
      beforeEnter: (to, from, next) => {
        const fromExperience = /\/experiences\/\d{1,}/.test(from.fullPath);

        if (fromExperience) return next();

        return next('/');
      }
    },
    // アクティビティ検索結果ページ
    { path: '/search', components:
      {
        default: Search,
        header: Header,
        pageMenu: PageMenu,
        footer: Footer,
      },
      beforeEnter: async (to, from, next) => {
        const searchData = {
          word: localStorage.getItem('searchWord'),
          score: localStorage.getItem('searchScore'),
        };

        if (searchData.word !== null) {
          await store.dispatch('searchWordScore',
          {
            word: searchData.word,
            score: searchData.score,
            case: 'search',
          });

          return next();
        };

        return next('/');
      },
    },
    { path: '/:name', name: "search", components:
      {
        default: Search,
        header: Header,
        pageMenu: PageMenu,
        footer: Footer,
      },
      beforeEnter: async (to, from, next) => {
        // 検索用のボタンをクリックしていれば行う処理。
        if (to.params.case !== undefined) {
          localStorage.setItem('typeId', to.params.id);
        };
        const typeId = localStorage.getItem('caseId');
        switch (to.path) {
          // 目的別検索の場合。
          case '/hotel':
            store.state.search.searchData.typeWord = 'ホテル・コンドミニアム';
            await store.dispatch('searchCategory',
            {
              case: 'category',
              categoryId: 1,
            });
            break;
          case '/dinner':
            store.state.search.searchData.typeWord = '食事';
            await store.dispatch('searchCategory',
            {
              case: 'category',
              categoryId: 2,
            });
            break;
          case '/rentacar':
            store.state.search.searchData.typeWord = 'レンタカー';
            await store.dispatch('searchCategory',
            {
              case: 'category',
              categoryId: 3,
            });
            break;
          case '/leisure':
            store.state.search.searchData.typeWord = '遊び・体験';
            await store.dispatch('searchCategory',
            {
              case: 'category',
              categoryId: 4,
            });
            break;
          case '/landmark':
            store.state.search.searchData.typeWord = '観光地';
            await store.dispatch('searchCategory',
            {
              case: 'category',
              categoryId: 5,
            });
            break;
          case '/shopping':
            store.state.search.searchData.typeWord = 'ショッピング';
            await store.dispatch('searchCategory',
            {
              case: 'category',
              categoryId: 6,
            });
            break;
          case 'landmark':
            store.state.search.searchData.typeWord = 'ショッピング';
            await store.dispatch('searchGenre',
            {
              case: 'genre',
              genreId: 1,
            });
            break;
          case 'restaurant':
            store.state.search.searchData.typeWord = 'ショッピング';
            await store.dispatch('searchGenre',
            {
              case: 'genre',
              genreId: 2,
            });
            break;
          case 'rentacar':
            store.state.search.searchData.typeWord = 'ショッピング';
            await store.dispatch('searchGenre',
            {
              case: 'genre',
              genreId: 3,
            });
            break;
          case 'card-shop':
            store.state.search.searchData.typeWord = 'ショッピング';
            await store.dispatch('searchGenre',
            {
              case: 'genre',
              genreId: 4,
            });
            break;
          case 'hotel':
            store.state.search.searchData.typeWord = 'ショッピング';
            await store.dispatch('searchGenre',
            {
              case: 'genre',
              genreId: 5,
            });
            break;
          case 'aquarium':
            store.state.search.searchData.typeWord = 'ショッピング';
            await store.dispatch('searchGenre',
            {
              case: 'genre',
              genreId: 6,
            });
            break;
          case 'convenience-store':
            store.state.search.searchData.typeWord = 'ショッピング';
            await store.dispatch('searchGenre',
            {
              case: 'genre',
              genreId: 7,
            });
            break;
          case 'zoo':
            store.state.search.searchData.typeWord = 'ショッピング';
            await store.dispatch('searchGenre',
            {
              case: 'genre',
              genreId: 8,
            });
            break;
          case 'hawaian-restaurant':
            store.state.search.searchData.typeWord = 'ショッピング';
            await store.dispatch('searchGenre',
            {
              case: 'genre',
              genreId: 9,
            });
            break;
          case 'western-food':
            store.state.search.searchData.typeWord = 'ショッピング';
            await store.dispatch('searchGenre',
            {
              case: 'genre',
              genreId: 10,
            });
            break;
          case 'japanese-food':
            store.state.search.searchData.typeWord = 'ショッピング';
            await store.dispatch('searchGenre',
            {
              case: 'genre',
              genreId: 11,
            });
            break;
          case 'shopping-mall':
            store.state.search.searchData.typeWord = 'ショッピング';
            await store.dispatch('searchGenre',
            {
              case: 'genre',
              genreId: 12,
            });
            break;
          case 'fashion':
            store.state.search.searchData.typeWord = 'ショッピング';
            await store.dispatch('searchGenre',
            {
              case: 'genre',
              genreId: 13,
            });
            break;
          case 'supar':
            store.state.search.searchData.typeWord = 'ショッピング';
            await store.dispatch('searchGenre',
            {
              case: 'genre',
              genreId: 14,
            });
            break;
          // 島名検索の場合。
          case '/hawaii':
            store.state.search.searchData.typeWord = 'ハワイ島';
            await store.dispatch('searchIsland',
            {
              case: 'island',
              islandId: 1,
            });
            break;
          case '/maui':
            store.state.search.searchData.typeWord = 'マウイ島';
            await store.dispatch('searchIsland',
            {
              case: 'island',
              islandId: 2,
            });
            break;
          case '/kahoolawe':
            store.state.search.searchData.typeWord = 'カホオラウェ島';
            await store.dispatch('searchIsland',
            {
              case: 'island',
              islandId: 3,
            });
            break;
          case '/lanai':
            store.state.search.searchData.typeWord = 'ラナイ島';
            await store.dispatch('searchIsland',
            {
              case: 'island',
              islandId: 4,
            });
            break;
          case '/molokai':
            store.state.search.searchData.typeWord = 'モロカイ島';
            await store.dispatch('searchIsland',
            {
              case: 'island',
              islandId: 5,
            });
            break;
          case '/oahu':
            store.state.search.searchData.typeWord = 'オアフ島';
            await store.dispatch('searchIsland',
            {
              case: 'island',
              islandId: 6,
            });
            break;
          case '/kauai':
            store.state.search.searchData.typeWord = 'カウアイ島';
            await store.dispatch('searchIsland',
            {
              case: 'island',
              islandId: 7,
            });
            break;
          case '/niihau':
            store.state.search.searchData.typeWord = 'ニイハウ島';
            await store.dispatch('searchIsland',
            {
              case: 'island',
              islandId: 8,
            });
            break;
          // エリア検索の場合。
          case '/honolulu':
            store.state.search.searchData.typeWord = 'ホノルル';
            await store.dispatch('searchArea',
            {
              case: 'area',
              areaId: 1,
            });
            break;
          case '/wailuku':
            store.state.search.searchData.typeWord = 'ワイルク';
            await store.dispatch('searchArea',
            {
              case: 'area',
              areaId: 2,
            });
            break;
          case '/waikiki':
            store.state.search.searchData.typeWord = 'ワイキキ';
            await store.dispatch('searchArea',
            {
              case: 'area',
              areaId: 3,
            });
            break;
          case '/wahiawa':
            store.state.search.searchData.typeWord = 'ワヒアワ';
            await store.dispatch('searchArea',
            {
              case: 'area',
              areaId: 4,
            });
            break;
          case '/kailua-kona':
            store.state.search.searchData.typeWord = 'カイルア コナ';
            await store.dispatch('searchArea',
            {
              case: 'area',
              areaId: 5,
            });
            break;
          default:
            return next('/');
            break;
        };

        return next();
      },
    },
  ]
});
