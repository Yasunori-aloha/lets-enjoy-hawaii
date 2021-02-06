<template>
  <div class="review__wrapper">
    <div class="review__form">
      <form>
        <Title />
        <Score />
        <Comment />
        <Picture />
        <div class="review__submit">
          <button class="submit btn__hover">投稿する</button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import Title from '../components/ReviewPage/Title.vue';
import Score from '../components/ReviewPage/Score.vue';
import Comment from '../components/ReviewPage/Comment.vue';
import Picture from '../components/ReviewPage/Picture.vue';

export default {
  components: {
    Title,
    Score,
    Comment,
    Picture,
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

  .review__submit{
    margin-top: 31px;
    height: 100px;
    border-top: 1px solid #ccc;
    display: flex;
    justify-content: center;
  }
  .submit{
    height: 57px;
    width: 282px;
    margin: 50px 10px 0;
    font-size: 24px;
    border-radius: 3px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    color: #ffffff;
    border: none;
    background-color: #00b900;
    cursor: pointer;
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
