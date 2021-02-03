<template>
  <div>
    <router-view name="header" />
    <ExperiencesPageMenu />
    <div class="experience__page__wrapper">
      <div class="experience__page__left"></div>
      <div class="experience__page__right"></div>
    </div>
    <router-view name="footer" />
  </div>
</template>

<script>
import ExperiencesPageMenu from '../components/ExperiencesPage/ExperiencesPageMenu.vue';
export default {
  components: {
    ExperiencesPageMenu,
  }
};
</script>

<style scoped>
/* アクティビティ詳細表示欄 */
  .experience__page__wrapper{
  font-size: 10px;
  margin: 0 auto;
  width: 950px;
  display: flex;
  margin-bottom: 30px;
  }
  .experience__page__left{
    width: 740px;
    margin-right: 30px;
  }
  .experience__page__right{
    width: calc(100% - 770px)
  }
</style>
