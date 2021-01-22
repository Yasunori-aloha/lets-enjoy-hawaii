<template>
  <div class="leh__header">
    <router-link to="/" class='root__to'>
      <img src="/assets/leh_logo.png" alt="アイコン画像" class="leh__icon">
    </router-link>
    <ul class="signup__login__wrapper">
      <li>
        <a href="/users/sign_in" class="sl__link link__hover">ログイン</a>
      </li>
      <li>
        <a href="/users/sign_up" class="sl__link link__hover">会員登録</a>
      </li>
    </ul>
  </div>
</template>

<script>
export default {

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
  .leh__icon{
    height: 80px;
    width: 80px;
    margin-bottom: 5px;
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
  .link__hover{
    color: #0000ff;
  }
  .link__hover:hover{
    text-decoration-line: underline;
    color: #ffa500;
  }
</style>
