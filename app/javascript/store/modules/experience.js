import axios from 'axios';

export default {
  state: {
    experienceData: null,
  },
  getters: {
    experienceData: state => state.experienceData,
  },
  actions: {
    toExperiencesPage: async function({}, experienceId) {
      await axios.get(`/api/v1/experiences/${experienceId}`)
      .then(response => {
        this.state.experience.experienceData = response.data;
      });
    },
  },
};
