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
    setExperiencesList(state, list) {
      this.state.search.experiencesList = list;
      this.state.sort.sort.activeList = list;
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
        this.commit('setExperiencesList', response.data);
      });
    },
    searchGenre: async function({}, params) {
      await axios.get('/api/v1/search',
      {
        params: {
          case: params.case,
          genre_id: params.genreId,
        }
      })
      .then(response => {
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
        this.state.sort.sort.activeList = response.data;
      });
    },
    searchArea: async function({}, params) {
      await axios.get('/api/v1/search',
      {
        params: {
          case: params.case,
          area_id: params.areaId,
        }
      })
      .then(response => {
        this.state.sort.sort.activeList = response.data;
      });
    },
    searchIsland: async function({}, params) {
      await axios.get('/api/v1/search',
      {
        params: {
          case: params.case,
          island_id: params.islandId,
        }
      })
      .then(response => {
        this.state.sort.sort.activeList = response.data;
      });
    },
  },
};
