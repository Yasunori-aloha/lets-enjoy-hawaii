
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

      expect(store.getters['mapImageData']['mapImages'][firstMap]).toMatch('/images/hawaiian_islands.png');
    });
    test('mapImageIndexの値が変わると地図表示も変わる', () => {
      store.getters['mapImageData']['mapImageIndex'] = 0;
      const changeMap = store.getters['mapImageData']['mapImageIndex'];

      expect(store.getters['mapImageData']['mapImages'][changeMap]).toMatch('/images/hawaiian_islands_island_of_hawaii.png');
    });
  });
});
