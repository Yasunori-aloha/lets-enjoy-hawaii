<template>
  <div class="review__wrapper">
    <div class="review__form">
      <form>
        <Title />
        <Score />
        <Comment />
        <ul class="review__picture">
          <li class="review__picture__title">
            <h2 class="picture__title">写真</h2>
          </li>
          <li class="picture__btn">
            <i class="fas fa-camera"></i>
            <label for="review_images" class="picture__add">写真を追加する</label>
            <input type="file" id="review_images" name="review[images][]" multiple="multiple" class="hidden">
          </li>
          <li>
            <p class="picture__info">写真を複数選択して、一度に追加することができます。</p>
          </li>
          <li class="picture__main__wrapper">
            <div class="picture__preview__area"></div>
          </li>
        </ul>
      </form>
    </div>
  </div>
</template>

<script>
import Title from '../components/ReviewPage/Title.vue';
import Score from '../components/ReviewPage/Score.vue';
import Comment from '../components/ReviewPage/Comment.vue';

export default {
  components: {
    Title,
    Score,
    Comment,
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
/* 口コミ写真タイトル表示欄 */
  .review__picture{
    margin-top: 30px;
  }
  .review__picture__title{
    display: flex;
    align-items: flex-end;
    color: #ff4500;
    border-bottom: 3px solid #ff4500;
  }
  .picture__title{
    font-weight: bold;
    font-size: 18px;
  }
/* 口コミ写真追加ボタン表示欄 */
  .picture__btn{
    height: 30px;
    width: 188px;
    margin-top: 15px;
    padding-left: 8px;
    font-size: 19px;
    border: 1px solid #ccc;
    border-radius: 3px;
    background: linear-gradient(#ffffff, #e4e4e4);
    color: #787878;
    display: flex;
    align-items: center;
    position: relative;
  }
  .picture__add{
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    line-height: 28px;
    font-size: 14px;
    font-weight: bold;
    text-align: center;
    color: #333333;
    cursor: pointer;
  }
  .picture__info{
    font-size: 12px;
    text-align: right;
    margin-block-start: 1px;
    margin-block-end: 0;
  }
/* 添付画像プレビュー欄 */
  .picture__main__wrapper{
    margin-top: 10px;
    border-radius: 4px;
    background-color: #eee;
    display: flex;
  }
  .picture__preview__area{
    display: flex;
    flex-wrap: wrap;
    height: 215px;
    width: 710px;
    margin: 20px auto;
    border: 3px dotted #ccc;
    background-color: #ffffff;
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
