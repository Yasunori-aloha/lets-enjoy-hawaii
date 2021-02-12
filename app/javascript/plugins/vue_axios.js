const VueAxiosPlugin = {}
export default VueAxiosPlugin.install = function (Vue, { axios, csrfToken }) {
  if (!axios) {
    console.error('axiosが設定されていません。');
    return
  };

  if (typeof csrfToken === 'function') {
    axios.defaults.headers.common['X-CSRF-Token'] = csrfToken();
  };

  if (localStorage.getItem('access-token')) {
    axios.defaults.headers.common['access-token'] = localStorage.getItem('access-token');
    axios.defaults.headers.common['client'] = localStorage.getItem('client');
    axios.defaults.headers.common['uid'] = localStorage.getItem('uid');
  }

  Vue.axios = axios;

  Object.defineProperties(Vue.prototype, {
    axios: {
      get () {
        return axios;
      }
    }
  })
};
