import axios from 'axios';

export default {
  state: {
    reviewData: {
      score: null,
      title: null,
      comment: null,
      images: [],
    },
  },
  getters: {
    reviewData: state => state.reviewData,
  },
};
