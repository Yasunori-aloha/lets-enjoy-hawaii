import { createLocalVue } from '@vue/test-utils'
import axios from 'axios';
import Vuex from 'vuex'
import user from '../store/modules/user'

const localVue = createLocalVue();
localVue.use(Vuex);

jest.mock('axios')

describe('store/user.js', () => {
  let store

  beforeEach(() => {
    store = new Vuex.Store(user)
  })

  describe('getters', () => {
    test('ユーザー認証用トークンを取得：userTokens', () => {
      const userTokens = {
        'access-token': null,
        'client': null,
        'uid': null,
      }

      expect(store.getters['userTokens']).toEqual(userTokens)
    })
    test('ログインユーザー情報を取得：userData', () => {
      const userData = {
        id: null,
        name: null,
        email: null,
        introduce: null,
        admin: null,
        favorites_counts: null,
        reviews_counts: null,
        histories_counts: null,
      }

      expect(store.getters['userData']).toEqual(userData)
    })
    test('ログインユーザーの口コミ情報を取得：userReviews', () => {
      const userReviews = null

      expect(store.getters['userReviews']).toEqual(userReviews)
    })
    test('ログインユーザーのいいね一覧を取得：userFavorites', () => {
      const userFavorites = null

      expect(store.getters['userFavorites']).toEqual(userFavorites)
    })
    test('ログインユーザーの行った一覧を取得：userHistories', () => {
      const userHistories = null

      expect(store.getters['userHistories']).toEqual(userHistories)
    })
  })

  describe('actions', () => {
    test('ユーザー認証用トークンがあれば自動ログインをする：autoLogin', () => {

    })
    test('ユーザーを新規登録して、VuexとLocalStorageにデータを格納する：userSignUp', async () => {
      const commit = store.commit
      const signUpForms = [
        { input: 'テストユーザー' },
        { input: 'guest@sample.com' },
        { input: 'testpassword' },
        { input: 'testpassword' },
      ]
      const userTokens = {
        'access-token': 'testAccessToken',
        'client': 'testClentToken',
        'uid': 'testUidToken',
      }
      const userData = {
        id: '1',
        name: 'テストユーザー',
        email: 'guest@sample.com',
        introduce: '',
        admin: 'false',
        favorites_counts: '0',
        reviews_counts: '0',
        histories_counts: '0',
      }
      axios.post.mockResolvedValue({ headers: userTokens, data: userData })
      await user.actions['userSignUp']({ commit }, signUpForms)

      expect(store.getters['userTokens']).toEqual(userTokens)
      expect(store.getters['userData']).toEqual(userData)
      expect(window.localStorage.getItem('id')).toBe(userData['id'])
      expect(window.localStorage.getItem('name')).toBe(userData['name'])
      expect(window.localStorage.getItem('email')).toBe(userData['email'])
      expect(window.localStorage.getItem('introduce')).toBe(userData['introduce'])
      expect(window.localStorage.getItem('admin')).toBe(userData['admin'])
      expect(window.localStorage.getItem('access-token')).toBe(userTokens['access-token'])
      expect(window.localStorage.getItem('client')).toBe(userTokens['client'])
      expect(window.localStorage.getItem('uid')).toBe(userTokens['uid'])

    })
    test('メールアドレスが登録済みか確認する：isRegisterd', async () => {
      const email = 'guest@sample.com'
      axios.post.mockResolvedValue({ data: true })
      const response = await user.actions['isRegisterd']({}, email)

      expect(axios.post).toHaveBeenCalledWith('/api/v1/auth/check_email', { email: email })
      expect(response).toStrictEqual({ data: true })
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
