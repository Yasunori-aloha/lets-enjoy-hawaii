<template>
  <div class="sign__in__up__wrapper">
    <AppIcon class="sign__in__up__root__to"/>
    <SignInUpForm />
    <ul class="sign__in__up__footer__wrapper">
      <li class="sign__in__up__footer__link">
        <a href="mailto:t26.yasunori.yamasaki@gmail.com" class="leh__email">ヘルプ・お問い合わせ</a>
      </li>
      <li class="sign__in__up__copyright">
        Copyright© yasunori_yamasaki All Rights Reserved.
      </li>
    </ul>
  </div>
</template>

<script>
import AppIcon from '../components/AppIcon.vue';
import SignInUpForm from '../components/signInUp/SignInUpForm.vue';

export default {
  components: {
    AppIcon,
    SignInUpForm,
  }
};
</script>

<style scoped>
  .sign__in__up__wrapper{
    background: url('/assets/register_image.jpg');
    background-repeat: no-repeat;
    background-position: center center;
    background-size: cover;
    height: 100vh;
    position: relative;
  }
  .sign__in__up__root__to{
    position: absolute;
    top: 10px;
    left: 50px;
  }
  .sign__in__up__footer__wrapper{
    height: 60px;
    width: 100%;
    text-shadow: 1px 1px 1px black;
    text-align: center;
    position: absolute;
    bottom: 0;
  }
  .sign__in__up__footer__link{
    margin-bottom: 8px;
  }
  .leh__email{
    margin-bottom: 10px;
    color: white;
    font-size: 10px;
    text-decoration: none;
  }
  .sign__in__up__footer__wrapper{
    color: white;
    font-size: 10px;
  }
</style>
