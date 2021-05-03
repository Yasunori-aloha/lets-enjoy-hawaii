
import Vuex from 'vuex';
import home from '../store/modules/home';
import { createLocalVue } from '@vue/test-utils';

const localVue = createLocalVue();
localVue.use(Vuex);

describe('store/home.js', () => {
  let store;
  beforeEach(() => {
    store = new Vuex.Store(home);
  });

  describe('getters', () => {
    test('ホーム画面に表示する地図データを取得：mapImageData', () => {
      expect(store.getters['mapImageData']).toEqual({
      mapImages: [
        '/images/hawaiian_islands_island_of_hawaii.png',
        '/images/hawaiian_islands_maui.png',
        '/images/hawaiian_islands_kahoolawe.png',
        '/images/hawaiian_islands_lanai.png',
        '/images/hawaiian_islands_molokai.png',
        '/images/hawaiian_islands_oahu.png',
        '/images/hawaiian_islands_kauai.png',
        '/images/hawaiian_islands_niihau.png',
        '/images/hawaiian_islands.png',
      ],
      mapImageIndex: 8,
      })
    });
  });

  describe('mutations', () => {
    test('入力された値に地図画像番号を変更：mapChange', () => {
      const changeNumber = Math.floor(Math.random() * 8);

      home.mutations['mapChange'](store.state, changeNumber);
      expect(store.getters['mapImageData']['mapImageIndex']).toBe(changeNumber);
    });
    test('地図画像番号を初期状態に戻す：mapReset', () => {
      home.mutations['mapReset'](store.state);
      expect(store.getters['mapImageData']['mapImageIndex']).toBe(8);
    });
  });
});
