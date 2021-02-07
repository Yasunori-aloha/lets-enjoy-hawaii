import axios from 'axios';

export default {
  state: {
    searchData: {
      word: '',
      score: 0,
    },
    experiencesList: [],
  },
  getters: {
    searchData: state => state.searchData,
  },
  mutations: {
    resetSearchWordScore() {
      this.state.search.searchData.word = '';
      this.state.search.searchData.score = 0;
      localStorage.removeItem('searchWord');
      localStorage.removeItem('searchScore');
    },
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
        this.state.search.experiencesList = response.data;
        localStorage.setItem('searchWord', params.word);
        localStorage.setItem('searchScore', params.score);
      });
    },
  },
};
