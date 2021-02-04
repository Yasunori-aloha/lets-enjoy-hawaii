<template>
  <ul class="score__list">
    <li class="list__title">評価分布</li>
    <li v-for="(evalution, index) in evalutions" :key="evalution" class="list__score">
      <span class="evalution">{{ evalution }}</span>
      <span class="percent">{{ scorePercent(index) }}%</span>
      <div class="percent__graph">
        <div :style="percentGraph(0)" class="percent__graph__front"></div>
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
    percentGraph() {
      return {
        "--width": `${0}%`,
      }
    },
    scorePercent(index) {
      const score = this.scoreCounts[5 - index];
      if (!score) return 0;
      return score / this.reviewsCounts * 100;
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
</style>
