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
    test('')
  })

  describe('mutations', () => {
    test('')
  })

  describe('actions', () => {
    test('')
  })
})
