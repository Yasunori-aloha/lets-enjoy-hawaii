<template>
  <div>
    <Header v-if="checkSignInLogIn()" />
    <router-view />
    <Footer v-if="checkSignInLogIn()" />
  </div>
</template>

<script>
export default {
  methods: {
    // 会員登録・ログインページでは、ヘッダーとフッターを表示させない様にする。
    checkSignInLogIn() {
      if (this.$route.path === '/users/sign_in' || this.$route.path === 'users/sign_up') {
        return false;
      }else{
        return true;
      }
    },
  },
}
</script>

<style>
  .link__hover{
    color: #0000ff;
  }
  .link__hover:hover{
    text-decoration-line: underline;
    color: #ffa500;
  }
  .btn__hover:hover{
    background-color: #ffa500;
  }
</style>
