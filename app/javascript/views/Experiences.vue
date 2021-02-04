<template>
  <div>
    <router-view name="header" />
    <ExperiencesPageMenu />
    <div class="experience__page__wrapper">
      <div class="experience__page__left">
        <div class="experience__info__wrapper">
          <ExperiencesInfo />
          <ExperiencesMultiButton />
        </div>
        <div>
          <ExperiencesTab />
        </div>
      </div>
      <div class="experience__page__right"></div>
    </div>
    <router-view name="footer" />
  </div>
</template>

<script>
import ExperiencesPageMenu from '../components/ExperiencesPage/ExperiencesPageMenu.vue';
import ExperiencesInfo from '../components/ExperiencesPage/ExperiencesInfo.vue';
import ExperiencesMultiButton from '../components/ExperiencesPage/ExperiencesMultiButton.vue';
import ExperiencesTab from '../components/ExperiencesPage/ExperiencesTab.vue';

export default {
  components: {
    ExperiencesPageMenu,
    ExperiencesInfo,
    ExperiencesMultiButton,
    ExperiencesTab,
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
/* アクティビティ情報表示欄 */
  .experience__info__wrapper{
    display: flex;
    justify-content: space-between;
  }
  .experience__page__right{
    width: calc(100% - 770px)
  }
</style>
