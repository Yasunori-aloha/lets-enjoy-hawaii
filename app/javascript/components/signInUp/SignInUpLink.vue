<template>
  <div class="login__link__wrapper">
    <span class="login__link__title">アカウントをお持ちではありませんか？</span>
    <a href="/users/sign_up" class="login__text link__hover__not__underline">会員登録</a>
    <br>
  </div>
</template>

<script>
export default {

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
</style>
