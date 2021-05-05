import { createLocalVue } from '@vue/test-utils'
import axios from 'axios';
import Vuex from 'vuex'
import user from '../store/modules/user'

const localVue = createLocalVue();
localVue.use(Vuex);

jest.mock('axios')

describe('store/user.js', () => {
  let store
  let state
  let commit
  let userTokens
  let userData
  let nullUserTokens
  let nullUserData

  beforeEach(() => {
    store = new Vuex.Store(user)
    state = store.state
    commit = store.commit
    userTokens = {
      'access-token': 'testAccessToken',
      'client': 'testClentToken',
      'uid': 'testUidToken',
    }
    userData = {
      id: '1',
      name: 'テストユーザー',
      email: 'guest@sample.com',
      introduce: '',
      admin: 'false',
      favorites_counts: '0',
      reviews_counts: '0',
      histories_counts: '0',
    }
    nullUserTokens = {
      'access-token': null,
      'client': null,
      'uid': null,
    }
    nullUserData = {
      id: null,
      name: null,
      email: null,
      introduce: null,
      admin: null,
      image_url: null,
      favorites_counts: null,
      reviews_counts: null,
      histories_counts: null,
    }
  })

  afterEach(() => {
    user.mutations['updateUserData'](state, nullUserData)
    user.mutations['updateUserTokens'](state, nullUserTokens)
    user.mutations['updateLocalStorage'](state, { userData: nullUserData, userTokens: nullUserTokens})
  })

  describe('getters', () => {
    test('ユーザー認証用トークンを取得：userTokens', () => {
      expect(store.getters['userTokens']).toEqual(nullUserTokens)
    })
    test('ログインユーザー情報を取得：userData', () => {
      expect(store.getters['userData']).toEqual(nullUserData)
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
      userData = {
        id: '1',
        name: 'テストユーザー',
        email: 'guest@sample.com',
        introduce: '',
        admin: 'false',
        image_url: 'http:test',
      }
      user.mutations['updateLocalStorage'](state, { userData: userData, userTokens: userTokens})

      user.actions['autoLogin']({ commit })
      expect(store.getters['userTokens']).toEqual(userTokens)
      expect(store.getters['userData']).toEqual(userData)
    })
    test('ユーザーを新規登録して、VuexとLocalStorageにデータを格納する：userSignUp', async () => {
      const signUpForms = [
        { input: 'テストユーザー' },
        { input: 'guest@sample.com' },
        { input: 'testpassword' },
        { input: 'testpassword' },
      ]
      axios.post.mockResolvedValue({ headers: userTokens, data: userData })
      await user.actions['userSignUp']({ commit }, signUpForms)

      expect(axios.post).toHaveBeenCalledWith('/api/v1/auth', {
        name: signUpForms[0].input,
        email: signUpForms[1].input,
        password: signUpForms[2].input,
        password_confirmation: signUpForms[3].input,
      })
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
    test('ユーザーをログインさせる：userLogin', async () => {
      const loginForms = [
        { input: 'guest@sample.com' },
        { input: 'testpassword' },
      ]
      axios.post.mockResolvedValue({ headers: userTokens, data: userData })
      await user.actions['userLogin']({ commit }, loginForms)

      expect(axios.post).toHaveBeenCalledWith('/api/v1/auth/sign_in', {
        email: loginForms[0].input,
        password: loginForms[1].input,
      })
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
    test('ゲストユーザーとしてログインする：guestUserLogin', async () => {
      axios.post.mockResolvedValue({ headers: userTokens, data: userData})
      await user.actions['guestUserLogin']({ commit })

      expect(axios.post).toHaveBeenCalledWith('/api/v1/auth/sign_in', { guest_user: true })
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
    test('ユーザーをログアウトさせる：logout', async () => {
      user.mutations['updateUserData'](state, userData)
      user.mutations['updateUserTokens'](store.state, userTokens)
      user.mutations['updateLocalStorage'](state, { userData: userData, userTokens: userTokens})

      axios.delete.mockResolvedValue({ status: 200 })
      await user.actions['logout']({ commit })

      expect(axios.delete).toHaveBeenCalledWith('/api/v1/auth/sign_out', {
        headers: {
          'access-token': userTokens['access-token'],
          'client': userTokens['client'],
          'uid': userTokens['uid'],
        }
      })
      user.mutations['updateUserData'](state, nullUserData)
      expect(store.getters['userTokens']).toEqual(nullUserTokens)
      expect(store.getters['userData']).toEqual(nullUserData)
      expect(window.localStorage.getItem('id')).toBe(null)
      expect(window.localStorage.getItem('name')).toBe(null)
      expect(window.localStorage.getItem('email')).toBe(null)
      expect(window.localStorage.getItem('introduce')).toBe(null)
      expect(window.localStorage.getItem('admin')).toBe(null)
      expect(window.localStorage.getItem('access-token')).toBe(null)
      expect(window.localStorage.getItem('client')).toBe(null)
      expect(window.localStorage.getItem('uid')).toBe(null)
    })
    test('ユーザーページへ遷移する：toUsersPage', async () => {
      const userId = 1
      axios.get.mockResolvedValue({ data: {
        favorites_counts: 1,
        reviews_counts: 1,
        histories_counts: 1,
        userReviews: ['ダミー口コミ1', 'ダミー口コミ2'],
        userFavorites: ['ダミーお気に入り1', 'ダミーお気に入り2'],
        userHistories: ['ダミー訪問記録1', 'ダミー訪問記録2'],
      }})
      await user.actions['toUsersPage']({ commit }, userId)

      expect(store.getters['userData']['favorites_counts']).toBe(1)
      expect(store.getters['userData']['reviews_counts']).toBe(1)
      expect(store.getters['userData']['histories_counts']).toBe(1)
      expect(store.getters['userReviews']).toEqual(['ダミー口コミ1', 'ダミー口コミ2'])
      expect(store.getters['userFavorites']).toEqual(['ダミーお気に入り1', 'ダミーお気に入り2'])
      expect(store.getters['userHistories']).toEqual(['ダミー訪問記録1', 'ダミー訪問記録2'])
    })
  })
})
