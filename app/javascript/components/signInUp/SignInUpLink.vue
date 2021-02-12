<template>
  <div v-if="checkSignIn()" class="login__link__wrapper">
    <span class="login__link__title">アカウントをお持ちではありませんか？</span>
    <router-link to="/users/sign_up" class="login__text link__hover__not__underline">会員登録</router-link>
    <br>
  </div>
  <div v-else class="login__link__wrapper">
    <span class="login__link__title">すでにアカウントをお持ちですか？</span>
    <router-link to="/users/sign_in" class="login__text link__hover__not__underline">ログイン</router-link>
    <br>
  </div>
</template>

<script>
import { pathCheck } from "../../pathCheck.js";

export default {
  mixins: [pathCheck],
};
</script>

<style scoped>
.login__link__wrapper{
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: center;
  font-size: 14px;
  margin: 30px 0 -10px;
}
.login__link__title{
  margin-right: 5px;
}
.login__text{
  display: block;
  text-align: center;
  text-decoration: none;
  color: #008dde;
}
.link__hover__not__underline:hover {
  color: #ffa500;
}
</style>
