<template>
  <div class="score__wrapper">
    <div class="star__rating">
      <div :style="starRatingWidth(score)" class="star__rating__front">★★★★★</div>
      <div class="star__rating__back">★★★★★</div>
    </div>
    <span class="rating__point">{{ scoreToFixed(score) }}</span>
  </div>
</template>

<script>
export default {
  props: ["score"],
  methods: {
    starRatingWidth(score) {
      return {
        '--width': `${score * 20}%`,
      }
    },
    scoreToFixed(score) {
      return score.toFixed(1)
    },
  },
};
</script>

<style scoped>
/* 口コミ点数表示欄 */
  .score__wrapper{
    margin-top: 2px;
    display: flex;
  }
  .star__rating{
    margin-right: 6px;
    width: 5em;
    line-height: 22px;
    font-size: 22px;
    position: relative;
  }
  .star__rating__front{
    position: absolute;
    top: 0;
    left: 0;
    overflow: hidden;
    color: #ffa500;
    /* 点数によって動的に変更される。 */
    width: var(--width);
  }
  .star__rating__back{
    color: #808080;
  }
  .rating__point{
    line-height: 26px;
    font-size: 16px;
    color: black;
    font-weight: bold;
  }
</style>
