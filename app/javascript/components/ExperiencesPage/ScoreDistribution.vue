<template>
  <ul v-if="$mq !== 'sm'" class="score__list">
    <li class="list__title">評価分布</li>
    <li v-for="(evalution, index) in evalutions" :key="evalution" class="list__score">
      <span class="evalution">{{ evalution }}</span>
      <span class="percent">{{ scorePercent(index) }}%</span>
      <div class="percent__graph">
        <div :style="percentGraph(index)" class="percent__graph__front"></div>
        <div class="percent__graph__back"></div>
      </div>
    </li>
  </ul>
  <ul v-else class="score__list__sm">
    <li class="list__title__sm">評価分布</li>
    <li v-for="(evalution, index) in evalutions" :key="evalution" class="list__score__sm">
      <span class="evalution__back__sm">★★★★★</span>
      <span class="evalution__sm">{{ '★'.repeat(5 - index) }}</span>
      <span class="percent__sm">{{ scorePercent(index) }}%</span>
      <div class="percent__graph__sm">
        <div :style="percentGraph(index)" class="percent__graph__front"></div>
        <div class="percent__graph__back"></div>
      </div>
    </li>
  </ul>
</template>

<script>
export default {
  data() {
    return {
      evalutions: [
        '満足',
        'やや満足',
        '普通',
        'やや不満',
        '不満',
      ],
      percent: [],
    }
  },
  computed: {
    scoreCounts() {
      return this.$store.getters.experienceData.score_counts;
    },
    reviewsCounts() {
      return this.$store.getters.experienceData.reviews_counts;
    },
  },
  methods: {
    scorePercent(index) {
      const score = this.scoreCounts[5 - index];
      if (!score) return 0;
      return (score / this.reviewsCounts * 100).toFixed(0);
    },
    percentGraph(index) {
      const score = this.scoreCounts[5 - index];
      if (!score) return { "--width": '0%' };
      return {"--width": `${(score / this.reviewsCounts * 100).toFixed(0)}%`}
    },
  },
};
</script>

<style scoped>
/* アクティビティ評価分布表示欄 */
  .score__list{
    height: 180px;
    width: 240px;
    padding: 9px 8px;
    border: 1px solid #ccc;
    color: #333333;
  }
  .list__title{
    font-size: 14px;
    font-weight: bold;
  }
  .list__score{
    font-size: 12px;
    margin-top: 8px;
    display: flex;
    }
  .evalution{
    width: 78px;
    display: block;
  }
  .percent{
    width: 27px;
    margin-right: 11px;
    text-align: end;
    display: block;
  }
/* アクティビティ評価グラフ表示欄 */
  .percent__graph{
    height: 14px;
    width: 102px;
    margin-top: 2px;
    position: relative;
  }
  .percent__graph__front{
    height: 100%;
    background-color: #ffa500;
    width: var(--width);
  }
  .percent__graph__back{
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    border: 1px solid #ffa500;
  }
/* スマホ表示用 */
  .score__list__sm{
    height: 180px;
    padding: 6px 10px;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    color: #333333;
  }
  .list__title__sm{
    font-size: 13px;
    margin-bottom: 5px;
    font-weight: bold;
  }
  .list__score__sm{
    font-size: 12px;
    margin-bottom: 7px;
    display: flex;
    justify-content: flex-end;
    position: relative;
  }
  .percent__graph__sm{
    height: 14px;
    width: 180px;
    margin-top: 2px;
    position: relative;
  }
  .evalution__back__sm, .evalution__sm{
    line-height: 18px;
    font-size: 16px;
    position: absolute;
    left: 0;
  }
  .evalution__back__sm{
    color: #808080;
  }
  .evalution__sm{
    color: #FFA500;
  }
  .percent__sm{
    width: 27px;
    margin-right: 11px;
    font-size: 16px;
    text-align: end;
    display: block;
  }
</style>
