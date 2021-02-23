export default {
  state: {
    mapImageData: {
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
    },
  },
  getters: {
    mapImageData: state => state.mapImageData,
  },
  mutations: {
    // ホーム画面の地図をホバーすると、ホバーした島の表示が変更される。
    mapChange(state, number) {
      state.mapImageData.mapImageIndex = number;
    },
    mapReset(state) {
      state.mapImageData.mapImageIndex = 8;
    },
  },
};
