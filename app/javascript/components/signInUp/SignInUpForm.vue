<template>
  <div v-if="$mq !== 'sm'" class="sign__in__up__main">
    <span v-if="checkSignIn()" class="sign__in__up__text">ログイン</span>
    <span v-else class="sign__in__up__text">会員登録</span>
    <SignInUpInput />
    <!-- <SocialLoginLink /> -->
    <SignInUpLink />
    <div class="guest__user__sign__in__form">
      <span class="guest__user__login__text">※アカウント登録せず、ユーザー機能を試したい方は</span>
      <button @click="guestUserLogin()" class="guest__user__login__button link__hover__not__underline">こちら</button>
    </div>
  </div>
  <div v-else class="sign__in__up__main__sm">
    <span v-if="checkSignIn()" class="sign__in__up__text__sm">ログイン</span>
    <span v-else class="sign__in__up__text__sm">会員登録</span>
    <SignInUpInput />
    <!-- <SocialLoginLink /> -->
    <SignInUpLink />
    <div class="guest__user__sign__in__form">
      <span class="guest__user__login__text__sm">※アカウント登録せず、ユーザー機能を試したい方は</span>
      <button @click="guestUserLogin()" class="guest__user__login__button link__hover__not__underline">こちら</button>
    </div>
  </div>
</template>

<script>
import SocialLoginLink from '../signInUp/SocialLoginLink.vue';
import SignInUpLink from '../signInUp/SignInUpLink.vue';
import SignInUpInput from '../signInUp/SignInUpInput.vue';
import { pathCheck } from "../../pathCheck.js";

export default {
  mixins: [pathCheck],
  components: {
    SocialLoginLink,
    SignInUpLink,
    SignInUpInput,
  },
  methods: {
    guestUserLogin: async function() {
      await this.$store.dispatch('guestUserLogin').then(() => {
        this.$router.replace({ path: '/' });
      })
      .catch(error => {
        console.log(error.response.data);
      });
    }
  },
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
    margin: 90px 0;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .sign__in__up__text{
    margin-bottom: 30px;
    font-size: 22px;
    font-weight: 700;
    display: block;
    text-align: center;
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
    padding: 0;
    background-color: white;
    border: none;
    outline: none;
    cursor: pointer;
  }
  /* スマホ表示用 */
  .sign__in__up__main__sm{
    border-top: 1px solid #ccc;
  }
  .sign__in__up__text__sm{
    margin: 28px 0 7px;
    font-size: 21px;
    font-weight: 700;
    display: block;
    text-align: center;
  }
  .guest__user__login__text__sm{
    font-size: 13px;
    margin-right: 5px;
  }
</style>
