const VueAxiosPlugin = {}
export default VueAxiosPlugin.install = function (Vue, { axios, csrfToken }) {
  if (!axios) {
    console.error('axiosが設定されていません。');
    return
  };

  if (typeof csrfToken === 'function') {
    axios.defaults.headers.common['X-CSRF-Token'] = csrfToken();
  };

  Vue.axios = axios;

  Object.defineProperties(Vue.prototype, {
    axios: {
      get () {
        return axios;
      }
    }
  })
};
