<template>
  <div class="sign__in__up__wrapper">
    <div>
      <div class="sign__in__up__main">
        <span class="sign__in__up__text">ログイン</span>
        <div class="sign__in__up__form">
          <form action="" class="sign__in__up__user">
            <div class="sign__in__up__form__input">
              <input placeholder="メールアドレス" autocomplete="email" autocorrect="off" autocapitalize="off" type="email" name="user[email]"  class="sign__in__up__input">
              <span class="sign__in__up__error___message">この項目は必須です</span>
            </div>
            <div class="sign__in__up__form__input">
              <input placeholder="パスワード（8～20文字・半角英数字・記号を2種以上）" maxlength="20" autocomplete="current-password" size="20" type="password" name="user[password]" class="sign__in__up__input">
              <span class="sign__in__up__error___message">この項目は必須です</span>
            </div>
            <div class="remember__password">
              <label class="remember__me">
                <span aria-checked="true">
                  <input type="hidden" value="0" name="user[remember_me]">
                  <input type="checkbox" value="1" name="user[remember_me]">
                </span>
                <span>ログイン状態を保持</span>
              </label>
            </div>
            <input type="submit" name="commit" value="ログイン" class="sign__in__up__button button_cv btn__hover">
          </form>
        </div>
      </div>
    </div>
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
  .sign__in__up__wrapper > div {
    display: flex;
    justify-content: center;
  }
  .sign__in__up__main{
    width: 510px;
    border-radius: 10px;
    box-shadow: 0 1px 2px rgba(0,0,0, .05), 0 0 6px rgba(0,0,0,.15);
    display: flex;
    flex-direction: column;
    align-items: center;
    color: #484848;
    padding: 45px;
    background-color: white;
  }
  .sign__in__up__text{
    margin-bottom: 30px;
    font-size: 22px;
    font-weight: 700;
    display: block;
    text-align: center;
  }
  .sign__in__up__form{
    width: 100%;
  }
  .sign__in__up__user{
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 0 auto;
  }
  .sign__in__up__form__input{
    width: 100%;
    margin-bottom: 30px;
    position: relative;
  }
  .sign__in__up__input{
    border: 1px solid #ccc;
    appearance: none;
    height: 50px;
    width: 100%;
    outline: 0;
    border-radius: 6px;
    padding: 15px;
    font-size: 14px;
  }
  .sign__in__up__error___message{
    font-size: 12px;
    color: #ff0000;
    position: absolute;
    left: 0;
    top: 54px;
  }
  .remember__password{
    width: 100%;
    font-size: 13px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 15px;
  }
  .remember__me{
    cursor: pointer;
    display: flex;
    align-items: center;
  }
  .sign__in__up__button{
    width: 100%;
    font-size: 18px;
  }
  .button_cv{
  height: 50px;
  border: none;
  outline: 0;
  border-radius: 6px;
  cursor: pointer;
  color: #fff;
  background-color: #00b900;
  font-weight: 700;
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
