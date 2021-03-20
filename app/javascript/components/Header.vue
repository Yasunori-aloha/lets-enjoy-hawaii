<template>
  <div :class="{leh__header: $mq !== 'sm', leh__header__sm: $mq === 'sm'}">
    <AppIcon />
    <ul v-if="isAuthenticated" :class="{signup__login__wrapper: $mq !== 'sm', signup__login__wrapper__sm: $mq === 'sm'}">
      <li>
        <router-link :to="`/users/${userData.id}`" class="sl__link link__hover">{{ userData.name }}さんのマイページ</router-link>
      </li>
      <li>
        <span @click="userLogout()" class="sl__link link__hover">ログアウト</span>
      </li>
    </ul>
    <ul v-else :class="{signup__login__wrapper: $mq !== 'sm', signup__login__wrapper__sm: $mq === 'sm'}">
      <li>
        <span @click="guestUserLogin()" class="sl__link link__hover">ゲストユーザーログイン</span>
      </li>
      <li>
        <router-link to="/users/sign_in" class="sl__link link__hover">ログイン</router-link>
      </li>
      <li>
        <router-link to="/users/sign_up" class="sl__link link__hover">会員登録</router-link>
      </li>
    </ul>
  </div>
</template>

<script>
import AppIcon from '../components/AppIcon.vue';
import { mapGetters } from "vuex";

export default {
  components: {
    AppIcon,
  },
  computed: {
    ...mapGetters(["userData"]),
    isAuthenticated() {
      return this.$store.getters.userTokens['access-token'] !== null;
    },
  },
  methods: {
    guestUserLogin: async function() {
      await this.$store.dispatch('guestUserLogin').catch(error => {
        console.log(error.response.data);
      });
    },
    userLogout: async function() {
      const redirectRoot = /\/users\/\d/.test(this.$route.path)
      const redirectSignUp = /\/experience\/review/.test(this.$route.path);

      await this.$store.dispatch('logout');
      this.$store.commit('resetAlreadyFavorited');
      if (redirectRoot) {
        this.$router.replace({ path: '/' });
      } else if (redirectSignUp) {
        this.$router.replace({ path: '/users/sign_in' });
      }
    },
  },
};
</script>

<style scoped>
  .leh__header{
    align-items: flex-end;
    background-color: whitesmoke;
    display: flex;
    justify-content: space-between;
    font-size: 14px;
    padding: 10px 190px 0 50px;
  }
  .signup__login__wrapper{
    align-items: center;
    display: flex;
    height: 45px;
  }
  .signup__login__wrapper > li{
    margin-left: 10px;
    color: blue;
    text-decoration: underline;
  }
  .sl__link{
    cursor: pointer;
  }
  /* スマホ表示用 */
  .leh__header__sm{
    font-size: 10px;
    padding: 5px 10px 0 10px;
    align-items: flex-end;
    background-color: whitesmoke;
    display: flex;
    justify-content: space-between;
  }
  .signup__login__wrapper__sm{
    padding-bottom: 5px;
    align-items: flex-end;
    display: flex;
  }
  .signup__login__wrapper__sm > li{
    margin-left: 10px;
    color: blue;
    text-decoration: underline;
  }
</style>
