<template>
  <div v-if="$mq !== 'sm'" class="search__header">
    <img :src="searchGlassImage" alt="虫眼鏡アイコン" class="glass__icon">
    <b class="header__name">{{ searchHeaderName }}</b>
  </div>
  <div v-else class="search__header__sm">
    <h3 class="header__name__sm">{{ searchHeaderName }}</h3>
  </div>
</template>

<script>
export default {
  props: ['searchHeaderName'],
  data() {
    return {
      searchGlassImage: require('../../assets/images/glass_icon.png'),
    }
  },
};
</script>

<style scoped>
  .search__header{
    height: 30px;
    width: 395px;
    padding: 14px 0 0 20px;
    display: flex;
    align-items: center;
  }
  .glass__icon{
    height: 20px;
    width: 20px;
  }
  .header__name{
    height: 30px;
    color: #6e6e6e;
    font-size: 22px;
    margin-left: 5px;
  }
  /* スマホ表示用 */
  .search__header__sm{
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(#cdaa7d, #9f7f61);
  }
  .header__name__sm{
    font-size: 14px;
    padding: 2px 0;
    text-shadow: 0.5px 0.5px 0.5px #000;
    color: #fff;
  }
</style>
