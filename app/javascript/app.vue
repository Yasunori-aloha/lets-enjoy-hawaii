<template>
  <div>
    <Header v-if="checkSignInUp()" />
    <router-view />
    <Footer v-if="checkSignInUp()" />
  </div>
</template>

<script>
export default {
  methods: {
    // 会員登録・ログインページでは、ヘッダーとフッターを表示させない様にする。
    checkSignInUp() {
      if (this.$route.path === '/users/sign_in' || this.$route.path === '/users/sign_up') {
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
  .button__cv{
  height: 50px;
  border: none;
  outline: 0;
  border-radius: 6px;
  cursor: pointer;
  color: #fff;
  background-color: #00b900;
  font-weight: 700;
  }
</style>
