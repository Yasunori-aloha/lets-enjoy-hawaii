<template>
  <div class="review__form__score">
    <div class="review__score__title">
      <h2 class="score__title">総合評価</h2>
      <span class="score__info">（星をクリックして評価してください）</span>
      <span class="required__item">必須</span>
    </div>
    <ul class="review__score">
      <li v-for="index in 5">
        <label :for="`review_score${index}`" class="review__score__star">☆</label>
        <input type="radio" :id="`review_score${index}`" name="review[score]" :value="`${index}`" class="review__btn">
      </li>
    </ul>
  </div>
</template>

<script>
export default {

};
</script>

<style scoped>
/* 口コミの評価点選択欄 */
  .review__form__score{
    margin-top: 25px;
  }
  .review__score__title{
    display: flex;
    align-items: flex-end;
    color: #ff4500;
    border-bottom: 3px solid #ff4500;
  }
  .score__info{
    font-size: 12px;
    margin-bottom: 3px;
  }
/* 評価点用星表示欄 */
  .review__score{
    display: flex;
    font-size: 30px;
    margin: 5px 0 0 1px;
  }
  .review__score > li{
    height: 45px;
    width: 42px;
    position: relative;
    color: #ffa500;
    display: block;
  }
  .review__score__star{
    cursor: pointer;
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
  }
  .review__btn{
    display: none;
  }
</style>
