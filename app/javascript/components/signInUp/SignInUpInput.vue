<template>
  <div class="sign__in__up__form">
    <form action="" class="sign__in__up__user">
      <div v-for="form in signInForms" class="sign__in__up__form__input">
        <input :style="{'background-color': form.backGroundColor, 'border': `1px solid ${form.boderColor}`}" v-model="form.input" @blur="checkValidate(form)" :placeholder="form.placeholder" :autocomplete="form.autocomplete" :autocorrect="form.autocorrect" :autocapitalize="form.autocapitalize" :type="form.type" :name="form.name" :maxlength="form.maxlength" :size="form.size" class="sign__in__up__input">
        <span v-if="form.errorFlag" class="sign__in__up__error___message">{{ form.errorMessage }}</span>
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
  data() {
    return {
      signInForms: [
        {
          type: 'email',
          placeholder: 'メールアドレス',
          input: '',
          name: 'user[email]',
          autocomplete: 'email',
          autocorrect: 'off',
          autocapitalize: 'off',
          maxlength: '',
          size: '',
          backGroundColor: 'white',
          boderColor: '#ccc',
          errorFlag: false,
          errorMessage: '',
        },
        {
          type: 'password',
          placeholder: 'パスワード（8～20文字・半角英数字・記号を2種以上）',
          input: '',
          name: 'user[password]',
          autocomplete: 'current-password',
          autocorrect: '',
          autocapitalize: '',
          maxlength: '20',
          size: '20',
          backGroundColor: 'white',
          boderColor: '#ccc',
          errorFlag: false,
          errorMessage: '',
        },
      ],
      signUpForms: [],
    }
  },
  methods: {
    checkValidate(form) {
      form.errorFlag = false;
      form.errorMessage = '';
      form.backGroundColor = 'white';
      form.boderColor = '#ccc';
      if (!(form.input)) {
        form.errorFlag = true;
        form.errorMessage = 'この項目は必須です';
        form.backGroundColor = 'yellow';
        form.boderColor = 'red';
      } else {
        switch (form.type) {
          case 'email':
            if (!(form.input.match(/^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/))) {
              form.errorFlag = true;
              form.errorMessage = 'メールアドレスの形式で入力してください';
              form.backGroundColor = 'yellow';
              form.boderColor = 'red';
            }
            break;
          case 'password':
            if (!(form.input.match(/.{8,}/))) {
              form.errorFlag = true;
              form.errorMessage = 'パスワードは8文字以上必要です';
            } else {
              if (form.input.match(/^(?!.*[0-9]).*$/)) {
                form.errorFlag = true;
                form.errorMessage = '数字が挿入されておりません';
              } else if (form.input.match(/^(?!.*[a-zA-Z]).*$/)) {
                form.errorFlag = true;
                form.errorMessage = '英字が挿入されておりません';
              } else if (form.input.match(/^(?!.*[!-\/:-@\[-`\{-~].*[!-\/:-@\[-`\{-~]).*$/)) {
                form.errorFlag = true;
                form.errorMessage = '記号は2回以上が必要です';
              }
            }
            form.backGroundColor = 'yellow';
            form.boderColor = 'red';
            break;
        }
      }
    },
  },
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
