<template>
  <div class="sign__in__up__wrapper">
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
export default {

};
</script>

<style scoped>
  .sign__in__up__wrapper{
    background: url('/assets/register_image.jpg');
    background-repeat: no-repeat;
    background-position: center center;
    background-size: cover;
    height: 100vh;
  }
  .sign__in__up__footer__wrapper{
    height: 60px;
    width: 100%;
    text-align: center;
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
