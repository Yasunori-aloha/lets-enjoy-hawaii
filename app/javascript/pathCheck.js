export const pathCheck = {
  methods: {
    checkSignIn() {
      if (this.$route.path === '/users/sign_in') {
        return true;
      }else{
        return false;
      }
    },
  }
}
