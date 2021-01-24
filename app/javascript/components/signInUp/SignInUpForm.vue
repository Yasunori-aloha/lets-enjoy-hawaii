<template>
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
    <SocialLoginLink />
    <div class="login__link__wrapper">
      <span class="login__link__title">アカウントをお持ちではありませんか？</span>
      <a href="/users/sign_up" class="login__text link__hover__not__underline">会員登録</a>
      <br>
    </div>
    <div class="guest__user__sign__in__form">
      <span class="guest__user__login__text">※アカウント登録せず、ユーザー機能を試したい方は</span>
      <a href="/users/guest_sign_in" rel="nofollow" data-method="post" class="guest__user__login__button link_hover_not_underline">こちら</a>
    </div>
  </div>
</template>

<script>
import SocialLoginLink from '../signInUp/SocialLoginLink.vue';

export default {
  components: {
    SocialLoginLink,
  }
};
</script>

<style scoped>
.sign__in__up__main{
  width: 510px;
  padding: 45px;
  border-radius: 10px;
  box-shadow: 0 1px 2px rgba(0,0,0, .05), 0 0 6px rgba(0,0,0,.15);
  color: #484848;
  background-color: white;
  display: flex;
  flex-direction: column;
  align-items: center;
  position:absolute;
  top: 50%;
  left: 50%;
  transform:translate(-50%,-50%);
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
.social__login{
  width: 100%;
  text-align: center;
  border-top: 1px solid #ccc;
  margin-top: 30px;
  padding-top: 15px;
  position: relative;
}
.social__login__title{
  width: 50%;
  line-height: 20px;
  font-size: 14px;
  display: inline-block;
  text-align: center;
  margin: 0 -25%;
  position: absolute;
  top: -10px;
  background-color: #fff;
}
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
.guest__user__sign__in__form{
  width: 100%;
  margin-top: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
}
.guest__user__login__text{
  font-size: 14px;
  margin-right: 5px;
}
.guest__user__login__button{
  font-size: 14px;
  color: #008dde;
  text-decoration: none;
}
</style>
