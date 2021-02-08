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
    experiencesList: state => state.experiencesList,
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
          case: params.case,
        }
      })
      .then(response => {
        this.state.search.experiencesList = response.data;
        this.state.sort.sort.activeList = response.data;
      });
    },
  },
};
