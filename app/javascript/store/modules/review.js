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
      }).then(response => {
        console.log(response);
      });
    },
  },
};
