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
