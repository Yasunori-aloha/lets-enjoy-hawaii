<template>
  <div class="review__wrapper">
    <div class="review__title__area">
      <div class="review__title__icon"></div>
      <h1 class="review__title">{{ experienceData.name }}の口コミ一覧</h1>
    </div>
    <div class="review__info">
      <div class="review__number">
        <span>1 - {{ experienceData.reviews_counts }}件目</span>
        <span class="review__number__all">(全{{ experienceData.reviews_counts }}件中)</span>
      </div>
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
/* 口コミ件数表示欄 */
  .review__info{
    font-size: 16px;
    padding-bottom: 6px;
    margin-bottom: 10px;
    border-bottom: 3px solid #eee;
    word-spacing: 0;
    color:  #333333;
    display: flex;
    justify-content: space-between;
  }
  .review__number{
    display: flex;
  }
  .review__number__all{
    font-size: 12px;
    margin: 4px 0 0 5px;
  }
</style>
