<template>
  <div class='search__header'>
    <img src="/assets/glass_icon.png" alt="虫眼鏡アイコン" class="glass__icon">
    <b class="header__name">{{ name }}</b>
  </div>
</template>

<script>
export default {
  props: ['name']
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
</style>
