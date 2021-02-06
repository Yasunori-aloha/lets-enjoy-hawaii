<template>
  <div class="review__wrapper">
    <div class="review__form">
      <form>
        <ReviewTitle />
        <ReviewScore />
        <ReviewText />
      </form>
    </div>
  </div>
</template>

<script>
import ReviewTitle from '../components/ReviewPage/ReviewTitle.vue';
import ReviewScore from '../components/ReviewPage/ReviewScore.vue';
import ReviewText from '../components/ReviewPage/ReviewText.vue';

export default {
  components: {
    ReviewTitle,
    ReviewScore,
    ReviewText,
  },
};
</script>

<style scoped>
/* 口コミ投稿ページ表示欄 */
  .review__wrapper{
    width: 950px;
    margin: 0 auto 100px;
    display: flex;
    justify-content: space-between;
  }
  .review__form{
    width: 750px;
    color: #333333;
  }
</style>

<style>
/* 口コミの評価点選択欄 */
  .score__title{
    font-weight: bold;
    font-size: 18px;
  }
  .required__item{
    margin: 0 0 4px 5px;
    font-size: 11px;
    padding: 0 3px;
    color: #ffffff;
    background-color: #ff4500;
  }
</style>
