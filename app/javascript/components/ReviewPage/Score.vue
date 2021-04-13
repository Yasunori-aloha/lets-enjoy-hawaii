<template>
  <div v-if="$mq !== 'sm'" class="review__form__score">
    <div class="review__score__title">
      <h2 class="score__title">総合評価</h2>
      <span class="score__info">（星をクリックして評価してください）</span>
      <span class="required__item">必須</span>
    </div>
    <ul class="review__score">
      <li @mouseover="starOver(index - 1)" @mouseleave="starLeave(choiceStarId)" v-for="index in 5">
        <label @click="choiceStar(index - 1)" ref="star" :for="`review_score${index}`" class="review__score__star">☆</label>
        <input v-model="reviewData.score" type="radio" :id="`review_score${index}`" name="review[score]" :value="`${index}`" class="review__btn">
      </li>
    </ul>
  </div>
  <div v-else>
    <div class="review__score__title__sm">
      <span class="required__item__sm">必須</span>
      <h2 class="score__title__sm">総合評価</h2>
      <span class="score__info__sm">（星をタップして評価してください）</span>
    </div>
    <ul class="review__score__sm">
      <li @mouseover="starOver(index - 1)" @mouseleave="starLeave(choiceStarId)" v-for="index in 5">
        <label @click="choiceStar(index - 1)" ref="star" :for="`review_score${index}`" class="review__score__star">☆</label>
        <input v-model="reviewData.score" type="radio" :id="`review_score${index}`" name="review[score]" :value="`${index}`" class="review__btn">
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // 選択されている星から左は'☆'に変更されない様にする。
      choiceStarId: null,
    }
  },
  computed: {
    reviewData() {
      return this.$store.getters.reviewData;
    },
  },
  methods: {
    starOver(starId) {
      // ホバーした星から左を'★'に変更する。
      for (let index = 0; index <= starId; index++) {
        this.$refs.star[index].innerText = '★';
      };
    },
    // ホバーを外すと、選択されている星から右の星を'☆'に変更する。
    starLeave(choiceStarId) {
      if (choiceStarId === null) {
        this.$refs.star.forEach(star => {
          star.innerText = '☆';
        });
      } else {
        for (let index = (choiceStarId + 1); index <= 4; index++) {
          this.$refs.star[index].innerText = '☆';
        }
      };
    },
    // 選択された星から右の星を'☆'に変更する。
    choiceStar(starId) {
      this.choiceStarId = starId;
      for (let index = (starId + 1); index <= 4; index++) {
        this.$refs.star[index].innerText = '☆';
      };
    },
  },
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
  .review__score, .review__score__sm{
    display: flex;
  }
  .review__score{
    font-size: 30px;
    margin: 5px 0 0 1px;
  }
  .review__score > li, .review__score__sm > li{
    width: 42px;
    position: relative;
    color: #ffa500;
    display: block;
  }
  .review__score > li{
    height: 45px;
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
/* スマホ表示用 */
  .review__score__title__sm{
    height: 26px;
    line-height: 26px;
    margin-top: 5px;
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
  .score__info__sm{
    font-size: 12px;
  }
  .review__score__sm{
    font-size: 42px;
  }
  .review__score__sm > li{
    height: 66px;
    margin-left: 6px;
  }
</style>
