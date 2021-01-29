<template>
  <div v-if="checkSignIn()" class="sign__in__up__form">
    <form @submit.prevent="userLogin(signInForms)" class="sign__in__up__user">
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
      <button type="submit" name="commit" class="sign__in__up__button button_cv btn__hover">ログイン</button>
    </form>
  </div>
  <div v-else class="sign__in__up__form">
    <form @submit.prevent="userSignUp(signUpForms)" class="sign__in__up__user">
      <div v-for="form in signUpForms" class="sign__in__up__form__input">
        <input :style="{'background-color': form.backGroundColor, 'border': `1px solid ${form.boderColor}`}" v-model="form.input" @blur="checkValidate(form)" :placeholder="form.placeholder" :autocomplete="form.autocomplete" :autocorrect="form.autocorrect" :autocapitalize="form.autocapitalize" :type="form.type" :name="form.name" :maxlength="form.maxlength" :size="form.size" class="sign__in__up__input">
        <span v-if="form.errorFlag" class="sign__in__up__error___message">{{ form.errorMessage }}</span>
      </div>
      <input type="submit" name="commit" value="登録する" class="sign__in__up__button button_cv btn__hover">
    </form>
  </div>
</template>

<script>
import { pathCheck } from "../../pathCheck.js";

export default {
  mixins: [pathCheck],
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
          typeCheck: 'email',
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
          typeCheck: 'password',
        },
      ],
      signUpForms: [
        {
          type: 'text',
          placeholder: '氏名（例：畑中三郎）',
          input: '',
          name: '氏名（例：畑中三郎）',
          autocomplete: 'name',
          autocorrect: '',
          autocapitalize: '',
          maxlength: '',
          size: '',
          backGroundColor: 'white',
          boderColor: '#ccc',
          errorFlag: false,
          errorMessage: '',
          typeCheck: 'name',
        },
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
          typeCheck: 'email',
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
          typeCheck: 'password',
        },
        {
          type: 'password',
          placeholder: '上記と同じパスワードを入力してください',
          input: '',
          name: 'user[password_confirmation]',
          autocomplete: 'new-password',
          autocorrect: '',
          autocapitalize: '',
          maxlength: '20',
          size: '20',
          backGroundColor: 'white',
          boderColor: '#ccc',
          errorFlag: false,
          errorMessage: '',
          typeCheck: 'password_confirmation',
        },
      ],
    }
  },
  methods: {
    errorIndication(form, errorMessage) {
      form.errorMessage = errorMessage;
      form.errorFlag = true;
      form.backGroundColor = 'yellow';
      form.boderColor = 'red';
    },
    checkValidate(form) {
      // 入力不備が無ければ、表示させない様にする
      form.errorFlag = false;
      form.errorMessage = '';
      form.backGroundColor = 'white';
      form.boderColor = '#ccc';
      if (!(form.input)) {
        this.errorIndication(form, 'この項目は必須です');
      } else {
        switch (form.typeCheck) {
          case 'email':
            if (!(form.input.match(/^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/))) {
              this.errorIndication(form, 'メールアドレスの形式で入力してください');
            }
            break;
          case 'password':
            // パスワードが8文字以上か？
            if (!(form.input.match(/.{8,}/))) {
              this.errorIndication(form, 'パスワードは8文字以上で入力してください');
              // パスワードが20文字以下か？
            } else if (form.input.length === 20) {
              this.errorIndication(form, 'パスワードは20文字以下で入力してください');
              // パスワードに数字が入っているか？
            } else if (form.input.match(/^(?!.*[0-9]).*$/)) {
              this.errorIndication(form, '数字が挿入されておりません');
              // パスワードに英字が入っているか？
            } else if (form.input.match(/^(?!.*[a-zA-Z]).*$/)) {
              this.errorIndication(form, '英字が挿入されておりません');
              // パスワードに記号が2回以上が入っているか？
            } else if (form.input.match(/^(?!.*[!-\/:-@\[-`\{-~].*[!-\/:-@\[-`\{-~]).*$/)) {
              this.errorIndication(form, '記号は2回以上が必要です');
            }
            break;
          case 'password_confirmation':
            // パスワードにと同じ内容か？
            if (form.input !== this.signUpForms[2].input) {
              this.errorIndication(form, 'パスワードと同じ内容を入力してください');
            }
            break;
        }
      }
    },
    userLogin: async function(loginForms) {
      await this.$store.dispatch('userLogin', loginForms).then(() => {
        this.$router.replace({ path: '/' });
      })
      .catch(error => {
        console.log(error.response.data.errors);
      });
    },
    userSignUp: async function(signUpForms) {
      await this.$store.dispatch('userSignUp', signUpForms).then(() => {
        this.$router.replace({ path: '/' });
      });
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
