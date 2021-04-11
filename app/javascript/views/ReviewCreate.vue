<template>
  <div v-if="$mq !== 'sm'" class="review__wrapper">
    <div class="review__form">
      <form>
        <Title />
        <Score />
        <Comment />
        <Picture />
        <Submit />
      </form>
    </div>
  </div>
  <div v-else class="review__wrapper">
    <div class="review__form">
      <!-- <form>
        <Title />
        <Score />
        <Comment />
        <Picture />
        <Submit />
      </form> -->
    </div>
  </div>
</template>

<script>
import Title from '../components/ReviewPage/Title.vue';
import Score from '../components/ReviewPage/Score.vue';
import Comment from '../components/ReviewPage/Comment.vue';
import Picture from '../components/ReviewPage/Picture.vue';
import Submit from '../components/ReviewPage/Submit.vue';

export default {
  components: {
    Title,
    Score,
    Comment,
    Picture,
    Submit,
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
    margin: 0 auto;
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
