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
    islandData: {
      islandNames: [
        'ニイハウ',
        'オアフ',
        'カホオラウェ',
        'ラナイ',
        'モロカイ',
        'マウイ',
        'カウアイ',
        'ハワイ',
      ],
      islandUrl: [
        'niihau' ,
        'oahu' ,
        'kahoolawe' ,
        'lanai' ,
        'molokai' ,
        'maui' ,
        'kauai' ,
        'hawaii' ,
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
    islandData: state => state.islandData,
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
    searchWordScore: async function({ commit }, params) {
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
    searchGenre: async function({ commit }, params) {
      await axios.get('/api/v1/search',
      {
        params: {
          case: params.case,
          genre_id: params.genreId,
        }
      })
      .then(response => {
        this.commit('setExperiencesList', response.data);
      });
    },
    searchCategory: async function({ commit }, params) {
      await axios.get('/api/v1/search',
      {
        params: {
          case: params.case,
          category_id: params.categoryId,
        }
      })
      .then(response => {
        this.commit('setExperiencesList', response.data);
      });
    },
    searchArea: async function({ commit }, params) {
      await axios.get('/api/v1/search',
      {
        params: {
          case: params.case,
          area_id: params.areaId,
        }
      })
      .then(response => {
        this.commit('setExperiencesList', response.data);
      });
    },
    searchIsland: async function({ commit }, params) {
      await axios.get('/api/v1/search',
      {
        params: {
          case: params.case,
          island_id: params.islandId,
        }
      })
      .then(response => {
        this.commit('setExperiencesList', response.data);
      });
    },
  },
};
