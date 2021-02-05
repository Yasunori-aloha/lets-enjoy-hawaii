export default {
  state: {
    mapImageIndex: 8,
  },
  getters: {
    mapImageIndex: state => state.mapImageIndex,
  },
  mutations: {
    // ホーム画面の地図をホバーすると、ホバーした島の表示が変更される。
    mapChange(state, number) {
      state.mapImageIndex = number;
    },
    mapReturn(state, number) {
      state.mapImageIndex = number;
    },
  },
};
