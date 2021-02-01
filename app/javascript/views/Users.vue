<template>
  <div class="my__page__image">
    <div class="my__page__wrapper">
      <div class="my__page__head">
        <ul class="my__page__head__list">
          <li class="my__page__head__number">お気に入りした場所 {{ userFavoriteCounts }}</li>
          <li class="my__page__head__number">口コミ数 {{ userReviewCounts }}</li>
          <li class="my__page__head__number">行った場所 {{ userHistorieCounts }}</li>
        </ul>
      </div>
      <div class="my__page__main">
        <div class="my__page__main__left">
          <div class="my__page__side__menu__wrapper">
            <ul class="my__page__side__menu__list">
              <router-link :to="`/users/${userData.id}/edit`" tag="li" class="my__page__side__menu">会員情報の確認・変更</router-link>
              <router-link tag="li" :to="`/users/${userData.id}/favorites`"class="my__page__side__menu">お気に入りした場所</router-link>
              <router-link tag="li" :to="`/users/${userData.id}/histories`"class="my__page__side__menu">今までの口コミ</router-link>
              <router-link tag="li" :to="`/users/${userData.id}/reviews`"class="my__page__side__menu">行った場所</router-link>
            </ul>
          </div>
        </div>
        <UsersMain v-if="isUsersHome" />
        <router-view v-else />
      </div>
    </div>
  </div>
</template>

<script>
import UsersMain from '../components/UsersPage/UsersMain.vue';
import { mapGetters } from "vuex";

export default {
  components: {
    UsersMain,
  },
  computed: {
    ...mapGetters(["userData"]),
    isUsersHome() {
      return this.$route.path === `/users/${this.userData.id}`;
    },
    userReviewCounts() {
      if (this.$store.getters.userReviews) {
        return this.$store.getters.userReviews.length;
      } else {
        return 0;
      }
    },
    userFavoriteCounts() {
      if (this.$store.getters.userFavorites) {
        return this.$store.getters.userFavorites.length;
      } else {
        return 0;
      }
    },
    userHistorieCounts() {
      if (this.$store.getters.userHistories) {
        return this.$store.getters.userHistories.length;
      } else {
        return 0;
      }
    },
  },
  created() {
    console.log(/\/users\/\d/.test(this.$route.path));
  },
};
</script>

<style scoped>
/* 背景 */
  .my__page__image{
    background-attachment: fixed;
    background-image: url('/assets/mypage_image.jpg');
    background-position: center center;
    background-repeat: no-repeat;
    background-size: cover;
    height: 100%;
    min-height: calc(100vh - 185px);
    width: 100%;
  }
  .my__page__wrapper{
    background-color: rgba(0, 0, 0, 0.5);
    min-height: calc(100vh - 185px);
  }
/* ユーザーページヘッダー */
  .my__page__head{
    border-bottom: 1px solid #646464;
    display: flex;
    height: 94px;
    justify-content: center;
  }
  .my__page__head__list{
    color: white;
    font-size: 16px;
    height: 100%;
    padding-top: 12px;
    text-align: end;
    width: 950px;
  }
  .my__page__head__number{
    margin-bottom: 2px;
  }
/* ユーザーページメイン */
  .my__page__main{
    display: flex;
    justify-content: center;
  }
/* ユーザーページサイドメニュー */
  .my__page__main__left{
    height: calc(100vh - 279px);
    width: 436px;
    display: flex;
    justify-content: flex-end;
  }
  .my__page__side__menu__wrapper{
    height: 100%;
    width: 200px;
    padding-top: 30px;
  }
  .my__page__side__menu__list{
    height: 100%;
    width: 100%;
    padding-left: 10px;
  }
  .my__page__side__menu{
    margin-bottom: 10px;
    color: #fff;
    font-size: 14px;
    text-decoration: underline;
    cursor: pointer;
  }
  .my__page__side__menu:hover{
    opacity: 0.7;
  }
</style>

<style>
/* ユーザーページメインコンテンツ */
  .my__page__main__right{
    border-left: 1px solid #646464;
    min-height: calc(100vh - 279px);
    height: 100%;
    width: 1004px;
    padding: 0 243px 0 28px;
  }
</style>
