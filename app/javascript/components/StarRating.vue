<template>
  <div v-if="$mq !== 'sm'" class="score__wrapper">
    <div class="star__rating">
      <div :style="starRatingWidth(experience.score)" class="star__rating__front">★★★★★</div>
      <div class="star__rating__back">★★★★★</div>
    </div>
    <span class="rating__point">{{ scoreToFixed(experience.score) }}</span>
    <div v-if="!unnecessaryReviewCounts" style="display: flex;">
      <span class="review__counts">（</span>
      <router-link :to="`/experiences/${experience.id}/reviews`" class="review__link review__counts link__hover"false>口コミ{{ experience.reviews_counts }}件</router-link>
      <span class="review__counts">）</span>
    </div>
  </div>
  <div v-else style="display: flex;">
    <div class="star__rating__sm" :style="ratingFontSizeMethod(ratingFontSize)">
      <div :style="starRatingWidth(experience.score)" class="star__rating__front">★★★★★</div>
      <div class="star__rating__back">★★★★★</div>
    </div>
    <span class="rating__point__sm" :style="ratingPointFontSizeMethod(ratingPointFontSize)">{{ scoreToFixed(experience.score) }}</span>
    <div v-if="!unnecessaryReviewCounts && $mq !== 'sm'" style="display: flex;">
      <span class="review__counts">（</span>
      <router-link :to="`/experiences/${experience.id}/reviews`" class="review__link review__counts link__hover"false>口コミ{{ experience.reviews_counts }}件</router-link>
      <span class="review__counts">）</span>
    </div>
  </div>
</template>

<script>
export default {
  props: ["experience", "unnecessaryReviewCounts", "ratingFontSize", "ratingPointFontSize"],
  computed: {
    isSearchPage() {
      const currentPath = /\/search/.test(this.$route.path);
      return currentPath ? true : false
    },
  },
  methods: {
    starRatingWidth(score) {
      return {
        '--width': `${score * 20}%`,
      }
    },
    ratingFontSizeMethod(fontSize) {
      return {
        '--rating-font-size': `${fontSize}px`
      }
    },
    ratingPointFontSizeMethod(fontSize) {
      return {
        '--rating-point-font-size': `${fontSize}px`
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
/* 口コミ件数表示欄 */
  .review__counts{
    color: black;
    font-weight: unset;
    font-size: 12px;
    line-height: 25px;
  }
  .review__link{
    color: blue;
  }
  /* スマホ表示用 */
  .star__rating__sm{
    margin-right: 3px;
    width: 5em;
    line-height: 22px;
    position: relative;
    font-size: var(--rating-font-size);
  }
  .rating__point__sm{
    line-height: 24px;
    color: black;
    font-weight: bold;
    font-size: var(--rating-point-font-size);
  }
</style>
