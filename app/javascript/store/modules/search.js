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
    searchWordScore: async function({}, params) {
      await axios.get('/api/v1/search', {
        params: {
          'q[name_cont]': params.word,
          'q[score_gteq]': params.score,
        }
      })
      .then(response => {
        console.log(response);
      });
    },
  },
};
