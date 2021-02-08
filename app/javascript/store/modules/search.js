import axios from 'axios';

export default {
  state: {
    categoryData: {
      categoryImage: [
        'hotel_icon',
        'dinner_icon',
        'rentacar_icon',
        'leisure_icon',
        'landmark_icon',
        'shopping_icon',
      ],
      categoryName: [
        'ホテル',
        '食事',
        'レンタカー',
        '遊び・体験',
        '観光地',
        'ショッピング',
        'コンドミニアム',
      ],
      categoryUrl: [
        'hotel',
        'dinner',
        'rentacar',
        'leisure',
        'landmark',
        'shopping',
      ],
    },
    searchData: {
      word: '',
      score: 0,
      type: null,
      typeId: null,
    },
    experiencesList: [],
  },
  getters: {
    categoryData: state => state.categoryData,
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
    setSearchType(state, params) {
      this.state.search.searchData.type = params.case;
      this.state.search.searchData.typeId = params.id;
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
    searchCategory: async function({}, params) {
      await axios.get('/api/v1/search',
      {
        params: {
          case: params.case,
          category_id: params.categoryId,
        }
      })
      .then(response => {
        this.state.search.experiencesList = response.data;
        this.state.sort.sort.activeList = response.data;
      });
    },
  },
};
