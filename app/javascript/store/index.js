import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';
import { user, experience } from "./modules";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    mapImageIndex: 8,
    experienceData: null,
  },
  getters: {
    mapImageIndex: state => state.mapImageIndex,
    experienceData: state => state.experienceData,
  },
  mutations: {
    // ホーム画面の地図をホバーすると、ホバーした島の表示が変更される。
    mapChange(state, number) {
      state.mapImageIndex = number;
    },
    mapReturn(state, number) {
      state.mapImageIndex = number;
    },
  },
  actions: {
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
        if (this.state.experienceData !== null) {
          this.state.experienceData.already_favorited = false;
          this.state.experienceData.favorite_counts -= 1;
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
        if (this.state.experienceData !== null) {
          this.state.experienceData.already_historied = false;
        }
      });
    },
    toExperiencesPage: async function({}, experienceId) {
      await axios.get(`/api/v1/experiences/${experienceId}`)
      .then(response => {
        this.state.experienceData = response.data;
      });
    },
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
        this.state.experienceData.already_historied = true;
      });
    },
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
        this.state.experienceData.already_favorited = true;
        this.state.experienceData.favorite_counts += 1;
      });
    },
  },
  modules: {
    user,
    experience,
  },
});
