<template>
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
</template>

<script>
export default {

};
</script>

<style scoped>
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
</style>
