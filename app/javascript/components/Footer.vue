<template>
  <div :class="{leh__footer: $mq !== 'sm', leh__footer__sm: $mq === 'sm'}">
    <ul :class="{footer__link: $mq !== 'sm', footer__link__sm: $mq === 'sm'}">
      <li>
        <a href="mailto:t26.yasunori.yamasaki@gmail.com" class="leh__email">お問い合わせ</a>
      </li>
      <li>
        <span class="leh__copyright">Copyright©︎ yasunori_yamasaki All Rights Reserved.</span>
      </li>
    </ul>
  </div>
</template>

<style scoped>
  .leh__footer{
    background-color: whitesmoke;
    height: 90px;
  }
  .footer__link{
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: space-around;
  }
  .leh__email{
    font-size: 12px;
    text-decoration: none;
    color: gray;
  }
  .leh__copyright{
    font-size: 10px;
    color: gray;
  }
  /* スマホ表示用 */
  .leh__footer__sm{
    background-color: whitesmoke;
    height: 45px;
  }
  .footer__link__sm{
    font-size: 10px;
    color: gray;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .footer__link__sm > li{
    margin-top: 3px;
  }
</style>
