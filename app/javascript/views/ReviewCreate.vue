<template>
  <div class="review__wrapper">
    <div class="review__form">
      <form>
        <div class="review__form__tile">
          <div class="review__from__title__wrapper">
            <div class="head__icon"></div>
            <h1 class="head__name">口コミを投稿する</h1>
          </div>
        </div>
      </form>
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
  created() {
    console.log(this.experienceData);
  },
};
</script>

<style scoped>
/* 口コミ投稿ページ表示欄 */
  .review__wrapper{
    width: 950px;
    margin: 0 auto 100px;
    display: flex;
    justify-content: space-between;
  }
  .review__form{
    width: 750px;
    color: #333333;
  }
/* 口コミ投稿ページタイトル表示欄 */
  .review__form__tile{
    margin-top: 28px;
  }
  .review__from__title__wrapper{
    display: flex;
  }
  .head__icon{
    height: 22px;
    width: 5px;
    border-radius: 2px;
    background-color: #ff4500;
  }
  .head__name{
    font-size: 18px;
    font-weight: bold;
    margin-left: 8px;
  }
</style>
