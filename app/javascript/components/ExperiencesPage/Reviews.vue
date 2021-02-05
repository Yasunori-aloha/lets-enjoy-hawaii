<template>
  <div class="review__wrapper">
    <div class="review__title__area">
      <div class="review__title__icon"></div>
      <h1 class="review__title">{{ experienceData.name }}の口コミ一覧</h1>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    experienceData() {
      return this.$store.getters.experienceData;
    },
  },
};
</script>

<style scoped>
/* アクティビティ口コミ一覧表示欄 */
  .review__wrapper{
    height: 302px;
    height: auto !important;
    min-height: calc(100vh - 495px);
    margin-top: 16px;
  }
/* アクティビティ名称表示欄 */
  .review__title__area{
    display: flex;
  }
  .review__title__icon{
    height: 22px;
    width: 5px;
    border-radius: 2px;
    background-color: #ff4500;
    margin: 1px 5px 0 0;
  }
  .review__title{
    font-size: 18px;
    font-weight: bold;
    color: #333333;
    margin: 0 0 13px 3px;
  }
</style>
