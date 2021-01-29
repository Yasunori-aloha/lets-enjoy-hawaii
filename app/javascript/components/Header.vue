<template>
  <div class="leh__header">
    <AppIcon />
    <ul v-if="isAuthenticated" class="signup__login__wrapper">
      <li>
        <span @click="toUsersPage()" class="sl__link link__hover">{{ userData.name }}さんのマイページ</span>
      </li>
      <li>
        <span @click="userLogout()" class="sl__link link__hover">ログアウト</span>
      </li>
    </ul>
    <ul v-else class="signup__login__wrapper">
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
      return this.$store.getters.userToken !== null;
    },
  },
  methods: {
    toUsersPage: async function() {
      await this.$store.dispatch('toUsersPage', this.userData.id).then(() => {
        this.$router.push({ path: `/users/${this.userData.id}`});
      });
    },
    userLogout() {
      this.$store.dispatch('logout');
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
    padding: 10px 190px 0 50px;
  }
  .signup__login__wrapper{
    align-items: center;
    display: flex;
    height: 45px;
  }
  .signup__login__wrapper > li{
    font-size: 14px;
    margin-left: 10px;
    color: blue;
    text-decoration: underline;
  }
  .sl__link{
    cursor: pointer;
  }
</style>
