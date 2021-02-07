import axios from 'axios';

export default {
  state: {
    searchData: {
      word: '',
      score: 0,
    }
  },
  getters: {
    searchData: state => state.searchData,
  },
  mutations: {
  },
  actions: {
  },
};
