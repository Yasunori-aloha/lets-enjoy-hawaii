<template>
  <div v-if="isExists && $mq !== 'sm'" class="review__wrapper">
    <div class="review__title__area">
      <div class="review__title__icon"></div>
      <h1 class="review__title">{{ experienceData.name }}の口コミ一覧</h1>
    </div>
    <div class="review__info">
      <div class="review__number">
        <span>1 - {{ experienceData.reviews_counts }}件目</span>
        <span class="review__number__all">(全{{ experienceData.reviews_counts }}件中)</span>
      </div>
      <Sort />
    </div>
    <ul :class="{active__fade__in: sort.isFadeIn}">
      <li v-for="(review, index) in experienceData.reviews" :key="review.id" class="review__main__wrapper">
        <div class="review__main__area">
          <h2 class="review__main__title">{{ review.title }}</h2>
          <StarRating :experience="review" :unnecessaryReviewCounts="true" />
          <span class="triangle">▲</span>
          <div class="review__comment__area">
            <span>{{  review.comment  }}</span>
          </div>
          <div class="review__user__area">
            <UserImage :image="review.user.image_url" />
            <span class="review__user__name">{{ review.user.name }}さん</span>
          </div>
        </div>
      </li>
    </ul>
  </div>
  <div v-else-if="!isExists && $mq !== 'sm'" class="review__wrapper">
    <div class="review__title__area">
      <div class="review__title__icon"></div>
      <h1 class="review__title">{{ experienceData.name }}の口コミはまだありません</h1>
    </div>
  </div>
  <div v-else-if="isExists && $mq === 'sm'" class="review__wrapper__sm">
    <router-link to="/experience/review" class="reviews__post__sm">
      <i class="far fa-comment-dots fa-flip-horizontal"></i>
      <span>口コミを投稿する</span>
    </router-link>
    <div class="review__info__sm">
      <div class="review__number__sm">
        <span>1 - {{ experienceData.reviews_counts }}件</span>
        <span>(全{{ experienceData.reviews_counts }}件中)</span>
      </div>
      <Sort />
    </div>
    <ul :class="{active__fade__in: sort.isFadeIn}">
      <li v-for="(review, index) in experienceData.reviews" :key="review.id" class="review__main__wrapper">
        <div class="review__main__area">
          <h2 class="review__main__title">{{ review.title }}</h2>
          <StarRating :experience="review" :unnecessaryReviewCounts="true" />
          <span class="triangle">▲</span>
          <div class="review__comment__area">
            <span>{{  review.comment  }}</span>
          </div>
          <div class="review__user__area">
            <UserImage :image="review.user.image_url" />
            <span class="review__user__name">{{ review.user.name }}さん</span>
          </div>
        </div>
      </li>
    </ul>
  </div>
  <div v-else-if="!isExists && $mq === 'sm'" class="review__wrapper">
    <div class="review__title__area">
      <div class="review__title__icon"></div>
      <h1 class="review__title">{{ experienceData.name }}の口コミはまだありません</h1>
    </div>
  </div>
</template>

<script>
import Sort from '../Sort.vue';
import StarRating from '../StarRating.vue';
import UserImage from '../UserImage.vue';
import { mapGetters } from "vuex";

export default {
  components: {
    Sort,
    StarRating,
    UserImage,
  },
  computed: {
    ...mapGetters(["experienceData", "sort"]),
    isExists() {
      return this.experienceData.reviews_counts !== 0 ? true : false;
    },
  },
  beforeRouteLeave (to, from, next) {
    this.$store.commit('resetSort');
    next();
  }
};
</script>

<style scoped>
/* アクティビティ口コミ一覧表示欄 */
  .review__wrapper{
    height: 302px;
    height: auto !important;
    min-height: calc(100vh - 495px);
    margin-top: 16px;
  }
/* アクティビティ名称表示欄 */
  .review__title__area{
    display: flex;
  }
  .review__title__icon{
    height: 22px;
    width: 5px;
    border-radius: 2px;
    background-color: #ff4500;
    margin: 1px 5px 0 0;
  }
  .review__title{
    font-size: 18px;
    font-weight: bold;
    color: #333333;
    margin: 0 0 13px 3px;
  }
/* 口コミ件数表示欄 */
  .review__info{
    font-size: 16px;
    padding-bottom: 6px;
    border-bottom: 3px solid #eee;
    word-spacing: 0;
    color:  #333333;
    display: flex;
    justify-content: space-between;
  }
  .review__number{
    display: flex;
  }
  .review__number__all{
    font-size: 12px;
    margin: 4px 0 0 5px;
  }
/* 口コミ表示欄 */
  .review__main__wrapper{
    border-bottom: 3px solid #eee;
    padding: 12px 0 15px;
    color: #333333;
  }
  .review__main__area{
    width: 99%;
    margin: 0 auto;
  }
/* 口コミタイトル表示欄 */
  .review__main__title{
    font-size: 14px;
    font-weight: bold;
    color: #0000ff;
    text-decoration: underline;
  }
/* 口コミ本文表示欄 */
  .triangle{
    font-size: 14px;
    margin: -5px 0 0 27px;
    color: #eee;
  }
  .review__comment__area{
    font-size: 20px;
    margin-top: -7px;
    padding: 8px;
    border-radius: 6px;
    background-color: #eee;
  }
/* 口コミ投稿者情報表示欄 */
  .review__user__area{
    display: flex;
    margin-top: 10px;
  }
  .review__user__name{
    font-size: 11px;
    line-height: 32px;
  }
  .user__image {
    height: 30px;
    width: 30px;
    margin-right: 9px;
    background-color: #ccc;
  }
/* スマホ表示用 */
  .review__wrapper__sm{
    /* min-height: calc(100vh - 495px); */
    margin-top: 15px;
  }
  .reviews__post__sm{
    height: 40px;
    margin: 0 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    color: #000000;
    display: flex;
    justify-content: center;
    align-items: center;
    text-decoration: none;
    background: linear-gradient(#ffffff, #e4e4e4);
  }
  .reviews__post__sm > span{
    margin-left: 5px;
    font-size: 16px;
    font-weight: bold;
  }
  .fa-comment-dots{
    font-size: 22px;
  }
  .review__info__sm{
    display: flex;
    justify-content: space-between;
    margin: 12px 10px 0;
    font-size: 16px;
    font-weight: bold;
    align-items: flex-end;
  }
  .review__number__sm{
    display: flex;
    align-items: flex-end;
  }
  .review__number__sm span:first-of-type{
    margin-right: 11px;
  }
</style>
