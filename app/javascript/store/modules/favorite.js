import axios from 'axios';

export default {
  actions: {
    favoriteRegistration: async function({}, params) {
      await axios.post(`/api/v1/experiences/${params.experienceId}/favorites`,
      {
        headers: {
          'access-token': localStorage.getItem('access-token'),
          'client': localStorage.getItem('client'),
          'uid': localStorage.getItem('uid'),
        },
        user_id: params.userId
      })
      .then(response => {
        this.state.experience.experienceData.already_favorited = true;
        this.state.experience.experienceData.favorite_counts += 1;
      });
    },
    favoriteRemove: async function({}, params) {
      await axios.delete(`/api/v1/users/${params.userId}/favorites/${params.experienceId}`,
      {
        headers: {
          'access-token': localStorage.getItem('access-token'),
          'client': localStorage.getItem('client'),
          'uid': localStorage.getItem('uid'),
        }
      })
      .then(response => {
        if (this.state.experience.experienceData !== null) {
          this.state.experience.experienceData.already_favorited = false;
          this.state.experience.experienceData.favorite_counts -= 1;
        }
      });
    },
    updateFavoriteComment: async function({}, params) {
      await axios.patch(`/api/v1/users/${params.userId}/favorites/${params.favoriteId}`, params.formData,
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
