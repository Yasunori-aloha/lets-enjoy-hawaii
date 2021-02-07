import axios from 'axios';

export default {
  state: {
    searchData: {
      word: '',
      score: '',
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
