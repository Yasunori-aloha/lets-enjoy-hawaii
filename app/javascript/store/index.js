import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';
import { user, experience, favorite } from "./modules";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    mapImageIndex: 8,
  },
  getters: {
    mapImageIndex: state => state.mapImageIndex,
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
          this.state.experience.experienceData.already_historied = false;
        }
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
        this.state.experience.experienceData.already_historied = true;
      });
    },
  },
  modules: {
    user,
    experience,
    favorite,
  },
});
