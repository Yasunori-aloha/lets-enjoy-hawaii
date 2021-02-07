<template>
  <div class="search__wrapper">
    <div class="search__main__left"></div>
    <div class="search__main__right">
      <div class="search__right__area">
        <h2 class="right__area__title">最近のお気に入りスポット</h2>
        <div class="right__area__main">
          <img src="" class="favorite__image">
          <p class="favorite__name link__hover">テスト</p>
        </div>
        <div class="right__area__sub">
          <img src="" class="favorite__image">
          <p class="favorite__name__sub link__hover">テスト</p>
        </div>
      </div>
    </div>
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
/* 検索結果ページ右側要素表示欄 */
  .search__main__right{
    width: 210px;
  }
  .search__right__area{
    width: 180px;
    margin: 74px 0 0 auto;
    padding-top: 4px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }
  .right__area__title{
    margin: 4px 0 9px 5px;
    padding: 0 3px;
    border-left: 4px solid #ffa500;
    font-size: 12px;
    font-weight: bold;
    color: #333333;
  }
  .right__area__main{
    height: 38px;
    margin: 3px 0 7px;
    padding: 0 5px;
    display: flex;
  }
  .favorite__name{
    margin-top: 10px;
    font-size: 12px;
    font-weight: bold;
  }
  .right__area__sub{
    height: 47px;
    margin: 7px 0;
    padding: 9px 5px 0;
    border-top: 1px dotted #ccc;
    display: flex;
  }
  .favorite__image{
    height: 38px;
    width: 51px;
    margin-right: 4px;
  }
  .favorite__name__sub{
    line-height: 14px;
    margin-top: 4px;
    font-size: 12px;
    font-weight: bold;
  }
</style>
