<template>
  <div v-if="$mq !== 'sm'">
    <div class="review__content__title">
      <h2 class="score__title">口コミ</h2>
      <span class="required__item">必須</span>
    </div>
    <ul class="review__content__main">
      <li class="review__title__info">
        <div class="icon"></div>
        <label for="review_title" class="name">タイトル（50文字以内）</label>
      </li>
      <li class="review__title__main">
        <input v-model="reviewData.title" type="text" id="review_title" name="review[title]" maxlength="50" autocomplete="off" placeholder="体験した感想や伝えたいことをまとめましょう" size="50" class="review__title">
      </li>
      <li class="review__main__info">
        <div class="icon"></div>
        <label for="review_comment" class="name">内容（1000文字以内）</label>
      </li>
      <li class="review__main">
        <textarea v-model="reviewData.comment" name="review[comment]" id="review_comment" maxlength="1000" placeholder="ご自身が実際に体験を通して感じた感想をお聞かせください。
これから訪れようとしている人へのアドバイスやおすすめ等を記入してください。" class="review"></textarea>
      </li>
    </ul>
  </div>
  <div v-else>
    <div class="review__content__title__sm">
      <span class="required__item__sm">必須</span>
      <h2 class="score__title__sm">口コミ</h2>
    </div>
    <div class="review__content__main__sm">
      <label for="review_title" class="name__sm">タイトル（50文字以内）</label>
      <input v-model="reviewData.title" type="text" id="review_title" name="review[title]" maxlength="50" autocomplete="off" placeholder="体験した感想や伝えたいことをまとめましょう" size="50" class="review__title__sm">
      <label for="review_comment" class="name__sm">内容（1000文字以内）</label>
      <textarea v-model="reviewData.comment" name="review[comment]" id="review_comment" maxlength="1000" placeholder="ご自身が実際に体験したことについてお聞かせください。
これから訪れようとしている人へのアドバイスやおすすめ等を記入してください。" class="review__sm" />
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    reviewData() {
      return this.$store.getters.reviewData;
    },
  },
};
</script>

<style scoped>
/* 口コミの内容入力欄 */
  .review__content__title{
    display: flex;
    align-items: flex-end;
    color: #ff4500;
    border-bottom: 3px solid #ff4500;
    margin-top: 40px;
  }
  .review__content__main{
    margin-top: 17px;
  }
  .review__title__info{
    display: flex;
  }
  .icon{
    height: 22px;
    width: 5px;
    border-radius: 2px;
    background-color: #ff4500;
    height: 15px;
    border-radius: 1px;
  }
  .name{
    font-size: 14px;
    font-weight: bold;
    padding-left: 6px;
    line-height: 16px;
  }
  .review__title__main{
    padding-top: 6px;
  }
  .review__title{
    height: 24px;
    width: 752px;
    font-size: 13px;
  }
  .review__main__info{
    display: flex;
    margin-top: 12px;
  }
  .review__main{
    padding-top: 8px;
  }
  .review{
    height: 24px;
    width: 752px;
    font-size: 13px;
    resize: none;
    height: 182px;
  }
  input:focus::placeholder {
    color: transparent;
  }
/* スマホ表示用 */
  .review__content__title__sm{
    height: 26px;
    line-height: 26px;
    padding-left: 10px;
    font-size: 14px;
    display: flex;
    color: white;
    background-color: #FF4500;
  }
  .required__item__sm{
    height: 18px;
    width: 28px;
    line-height: calc(26px - (4px * 2));
    margin: 4px 0;
    font-size: 11px;
    text-align: center;
    color: #FF4500;
    background-color: white;
    display: block;
  }
  .score__title__sm{
    margin-left: 10px;
  }
  .review__content__main__sm{
    padding: 12px 10px 18px;
  }
  .name__sm{
    font-size: 12px;
  }
  .review__title__sm, .review__sm{
    width: calc(100vw - 20px);
    font-size: 13px;
    padding-left: 5px;
  }
  .review__title__sm{
    margin: 6px 0;
    height: 24px;
  }
  .review__sm{
    height: 101px;
    margin-top: 8px;
  }
</style>
