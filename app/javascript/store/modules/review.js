import axios from 'axios';

export default {
  state: {
    reviewData: {
      score: null,
      title: null,
      comment: null,
      images: null,
    },
  },
  getters: {
    reviewData: state => state.reviewData,
  },
};
