<template>
  <div class="search__wrapper">
    <div class="search__main__left"></div>
    <div class="search__main__right"></div>
  </div>
</template>

<script>
export default {
  computed: {
    searchData() {
      return this.$store.getters.searchData;
    },
  },
  beforeRouteLeave (to, from, next) {
    this.$store.commit('resetSearchWordScore');
    next();
  }
};
</script>

<style scoped>
/* 検索結果ページ表示欄 */
  .search__wrapper{
    min-height: calc(100vh - 216px);
    height: 100%;
    display: flex;
    justify-content: center;
  }
  .search__main__left{
    width: 740px;
  }
  .search__main__right{
    width: 210px;
  }
</style>
