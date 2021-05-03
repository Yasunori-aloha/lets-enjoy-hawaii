import Vuex from 'vuex';
import user from '../store/modules/user';
import { createLocalVue } from '@vue/test-utils';

const localVue = createLocalVue();
localVue.use(Vuex);

describe('store/user.js', () => {
  let store

  beforeEach(() => {
    store = new Vuex.Store(user)
  })

  describe('getters', () => {
    test('ユーザー認証用トークンを取得：userTokens', () => {

    })
    test('ログインユーザー情報を取得：userData', () => {

    })
    test('ログインユーザーの口コミ情報を取得：userReviews', () => {

    })
    test('ログインユーザーのいいね一覧を取得：userFavorites', () => {

    })
    test('ログインユーザーの行った一覧を取得：userHistories', () => {

    })
  })

  describe('actions', () => {
    test('ユーザー認証用トークンがあれば自動ログインをする：autoLogin', () => {

    })
    test('ユーザー登録をする：userSignUp', () => {

    })
    test('メールアドレスが登録済みか確認する：isRegisterd', () => {

    })
    test('ユーザーをログインさせる：userLogin', () => {

    })
    test('ゲストユーザーとしてログインする：guestUserLogin', () => {

    })
    test('ユーザーをログアウトさせる：logout', () => {

    })
    test('ユーザーページへ遷移する：toUsersPage', () => {

    })
    test('ユーザー情報をStoreとLocalStorageにセットする：updateUserData', () => {

    })
  })
})
