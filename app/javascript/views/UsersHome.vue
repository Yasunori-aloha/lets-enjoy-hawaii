<template>
  <div class="my__page__image">
    <div class="my__page__wrapper">
      <div class="my__page__head">
        <ul class="my__page__head__list">
          <li class="my__page__head__number">お気に入りした場所 {{ 0 }}</li>
          <li class="my__page__head__number">口コミ数 {{ userReviewCounts }}</li>
          <li class="my__page__head__number">行った場所 {{ 0 }}</li>
        </ul>
      </div>
      <div class="my__page__main">
        <div class="my__page__main__left">
          <div class="my__page__side__menu__wrapper">
            <ul class="my__page__side__menu__list">
              <li class="my__page__side__menu">会員情報の確認・変更</li>
              <li class="my__page__side__menu">お気に入りした場所</li>
              <li class="my__page__side__menu">今までの口コミ</li>
              <li class="my__page__side__menu">行った場所</li>
            </ul>
          </div>
        </div>
        <div class="my__page__main__right">
          <div class="my__page__user__info__head">
            <img src="/assets/no_image.jpg" alt="no_image"  class="my__page__user__image">
            <div class="my__page__user__name__area">
              <p class="my__page__user__name1">{{ userData.name }}</p>
              <span class="my__page__user__name2">さんのマイページ</span>
            </div>
          </div>
          <div class="my__page__user__info__main">
            <span>{{ userData.introduce }}</span>
            </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  computed: {
    ...mapGetters(["userData"]),
    userReviewCounts() {
      return this.$store.getters.userReviews.length;
    },
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
/* ユーザーページメインコンテンツ */
  .my__page__main__right{
    border-left: 1px solid #646464;
    min-height: calc(100vh - 279px);
    height: 100%;
    width: 1004px;
    padding: 0 243px 0 28px;
  }
  .my__page__user__info__head{
    min-height: 185px;
    width: 100%;
    background-color: rgba(255, 255, 255, 0.75);
    display: flex;
    margin: 28px 0;
    border-radius: 5px;
  }
  .my__page__user__image{
    height: 150px;
    width: 150px;
    margin: 17px;
    border-radius: 10px;
    border: 1px solid gray;
  }
  .my__page__user__name__area{
    min-height: 150px;
    width: calc(100% - 150px);
    margin: 17px 17px 17px 0;
    color: black;
    text-align: end;
  }
  .my__page__user__name1{
    min-height: calc(100% / 4 * 3);
    line-height: 112px;
    font-size: 60px;
  }
  .my__page__user__name2{
    font-size: 22px;
    line-height: 37px;
  }
  .my__page__user__info__main{
    width: 100%;
    background-color: rgba(255, 255, 255, 0.75);
    margin: 20px 0 28px;
    border-radius: 5px;
    min-height: 250px;
    display: block;
    color: black;
    padding: 25px 17px;
  }
</style>
