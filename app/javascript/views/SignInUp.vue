<template>
  <div v-if="$mq !== 'sm'" class="sign__in__up__wrapper">
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
  <div v-else>
    <AppIcon class="sign__in__up__root__to__sm" />
    <SignInUpForm />
    <ul class="sign__in__up__footer__wrapper__sm">
      <li class="sign__in__up__footer__link">
        <a href="mailto:t26.yasunori.yamasaki@gmail.com" class="leh__email__sm">ヘルプ・お問い合わせ</a>
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
    background-image: url('../../../public/images/register_image.jpg');
    background-repeat: no-repeat;
    background-position: center center;
    background-size: cover;
    min-height: 100vh;
    position: relative;
    display: grid;
    place-content: center;
    gap: 1ch;
  }
  .sign__in__up__root__to{
    position: absolute;
    top: 10px;
    left: 50px;
  }
  .sign__in__up__footer__wrapper{
    height: 60px;
    width: 100%;
    color: white;
    font-size: 10px;
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
  /* スマホ表示用 */
  .sign__in__up__root__to__sm{
    display: block;
    margin: 5px 0 0 10px;
  }
  .leh__email__sm{
    color: gray;
    font-size: 10px;
    text-decoration: none;
  }
  .sign__in__up__footer__wrapper__sm{
    height: 60px;
    width: 100%;
    color: gray;
    font-size: 10px;
    text-align: center;
    position: absolute;
    bottom: 0;
  }
</style>
