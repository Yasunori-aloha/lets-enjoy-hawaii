<template>
  <div>
    <router-view name="header" />
    <div class="experience__page__menu">
      <div>
        <router-link to="/" class="link__hover">トップページ</router-link>
        <span> › </span>
        <a href="/" class="link__hover">カテゴリー名{{  }}</a>
        <span> › アクティビティ名称{{  }}</span>
      </div>
    </div>
    <router-view name="footer" />
  </div>
</template>

<script>
export default {

};
</script>

<style scoped>
  .experience__page__menu{
    width: 950px;
    font-size: 10px;
    margin: 0 auto;
    padding: 10px 0 5px 0;
    border-bottom: 1px dotted black;
    text-align: left;
  }
</style>
