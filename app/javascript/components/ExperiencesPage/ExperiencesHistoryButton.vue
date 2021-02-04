<template>
  <li v-if="alreadyHistoried" class="history__place">
    <i class="fas fa-check"></i>
    <a href="" class="btn"></a>
    <span class="history">行った</span>
  </li>
  <li v-else class="history__place">
    <i class="fas fa-shoe-prints fa-rotate-270"></i>
    <a href="" class="btn"></a>
    <span class="history">行った</span>
  </li>
</template>

<script>
export default {
  computed: {
    alreadyHistoried() {
      return this.$store.getters.experienceData.already_historied;
    },
  },
};
</script>

<style scoped>
/* 訪問記録登録ボタン */
  .history__place{
    height: 25px;
    width: calc((170px - 5px) / 2) ;
    line-height: 25px;
    font-size: 15px;
    border: 1px solid #ccc;
    border-radius: 3px;
    padding-left: 5px;
    position: relative;
    background: linear-gradient(#ffffff, #e4e4e4);
    margin-left: 5px;
  }
  .history{
    float: right;
    margin-right: 6px;
  }
</style>
