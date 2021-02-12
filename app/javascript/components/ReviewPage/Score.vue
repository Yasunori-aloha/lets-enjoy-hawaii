<template>
  <div class="review__form__score">
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
