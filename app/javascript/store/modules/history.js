import axios from 'axios';

export default {
  actions: {
    historyRegistration: async function({}, params) {
      await axios.post(`/api/v1/experiences/${params.experienceId}/histories`,
      {
        headers: {
          'access-token': localStorage.getItem('access-token'),
          'client': localStorage.getItem('client'),
          'uid': localStorage.getItem('uid'),
        },
        user_id: params.userId
      })
      .then(response => {
        this.state.experience.experienceData.already_historied = true;
      });
    },
    historyRemove: async function({}, params) {
      await axios.delete(`/api/v1/users/${params.userId}/histories/${params.experienceId}`,
      {
        headers: {
          'access-token': localStorage.getItem('access-token'),
          'client': localStorage.getItem('client'),
          'uid': localStorage.getItem('uid'),
        }
      })
      .then(response => {
        if (this.state.experience.experienceData !== null) {
          this.state.experience.experienceData.already_historied = false;
        }
      });
    },
    updateHistoryComment: async function({}, params) {
      await axios.patch(`/api/v1/users/${params.userId}/histories/${params.historyId}`, params.formData,
      {
        headers: {
          'content-type': 'multipart/form-data',
          'access-token': localStorage.getItem('access-token'),
          'client': localStorage.getItem('client'),
          'uid': localStorage.getItem('uid'),
        }
      })
      .catch(error => {
        console.log(error.response.data);
      });
    },
  },
};
