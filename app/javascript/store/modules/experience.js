import axios from 'axios';

export default {
  state: {
    experienceData: null,
  },
  getters: {
    experienceData: state => state.experienceData,
  },
  mutations: {
    resetAlreadyFavorited() {
      this.state.experience.experienceData.already_favorited = false;
      this.state.experience.experienceData.already_historied = false;
    },
  },
  actions: {
    toExperiencesPage: async function({}, experienceId) {
      await axios.get(`/api/v1/experiences/${experienceId}`,
      {
        headers: {
          'access-token': localStorage.getItem('access-token'),
          'client': localStorage.getItem('client'),
          'uid': localStorage.getItem('uid'),
        }
      })
      .then(response => {
        this.state.experience.experienceData = response.data;
      });
    },
  },
};
