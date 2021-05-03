
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
    test('サイトアクセス時の初期表示の地図を取得', () => {
      const firstMap = store.getters['mapImageData']['mapImageIndex'];

      expect(store.getters['mapImageData']['mapImages'][firstMap]).toBe('/images/hawaiian_islands.png');
    });
    test('mapImageIndexの値が変わると地図表示も変わる', () => {
      store.getters['mapImageData']['mapImageIndex'] = 0;
      const changeMap = store.getters['mapImageData']['mapImageIndex'];

      expect(store.getters['mapImageData']['mapImages'][changeMap]).toBe('/images/hawaiian_islands_island_of_hawaii.png');
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
