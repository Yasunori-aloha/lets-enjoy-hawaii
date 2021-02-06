<template>
  <div class="review__wrapper">
    <div class="review__form">
      <form></form>
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
</style>
