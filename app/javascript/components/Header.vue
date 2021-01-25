<template>
  <div class="leh__header">
    <AppIcon />
    <ul class="signup__login__wrapper">
      <li>
        <router-link to="/users/sign_in" class="sl__link link__hover">ログイン</router-link>
      </li>
      <li>
        <a href="/users/sign_up" class="sl__link link__hover">会員登録</a>
      </li>
    </ul>
  </div>
</template>

<script>
import AppIcon from '../components/AppIcon.vue';

export default {
  components: {
    AppIcon,
  }
};
</script>

<style scoped>
  .leh__header{
    align-items: flex-end;
    background-color: whitesmoke;
    display: flex;
    justify-content: space-between;
    padding: 10px 190px 0 50px;
  }
  .signup__login__wrapper{
    align-items: center;
    display: flex;
    height: 45px;
  }
  .signup__login__wrapper > li{
    font-size: 14px;
    margin-left: 10px
  }
</style>
