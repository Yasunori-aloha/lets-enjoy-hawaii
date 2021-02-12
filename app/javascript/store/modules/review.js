import axios from 'axios';

export default {
  state: {
    reviewData: {
      score: '',
      title: '',
      comment: '',
      images: [],
    },
  },
  getters: {
    reviewData: state => state.reviewData,
  },
  mutations: {
    resetReviewData(state) {
      state.reviewData.score = '';
      state.reviewData.title = '';
      state.reviewData.comment = '';
      state.reviewData.images = [];
    },
  },
  actions: {
    createReview: async function({ commit }, params) {
      await axios.post(`/api/v1/experiences/${params.experienceId}/reviews`, params.formData,
      {
        headers: {
          'content-type': 'multipart/form-data',
          'access-token': localStorage.getItem('access-token'),
          'client': localStorage.getItem('client'),
          'uid': localStorage.getItem('uid'),
        }
      })
      .catch(error => {
        console.log(error.response.data.errors);
      });
    },
  },
};
