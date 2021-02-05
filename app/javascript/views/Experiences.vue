<template>
  <div>
    <router-view name="header" />
    <PageMenu />
    <div class="experience__page__wrapper">
      <div class="experience__page__left">
        <div class="experience__info__wrapper">
          <Info />
          <MultiButton />
        </div>
        <Tab />
        <div class="experience__main__wrapper">
          <div class="picture__score__wrapper">
            <ActivityPicture :activity="experienceData" />
            <ScoreDistribution />
          </div>
          <TimeLocation />
        </div>
      </div>
      <div class="experience__page__right"></div>
    </div>
    <router-view name="footer" />
  </div>
</template>

<script>
import PageMenu from '../components/ExperiencesPage/PageMenu.vue';
import Info from '../components/ExperiencesPage/Info.vue';
import MultiButton from '../components/ExperiencesPage/MultiButton.vue';
import Tab from '../components/ExperiencesPage/Tab.vue';
import ActivityPicture from '../components/ActivityPicture.vue';
import ScoreDistribution from '../components/ExperiencesPage/ScoreDistribution.vue';
import TimeLocation from '../components/ExperiencesPage/TimeLocation.vue';

export default {
  components: {
    PageMenu,
    Info,
    MultiButton,
    Tab,
    ActivityPicture,
    ScoreDistribution,
    TimeLocation,
  },
  computed: {
    experienceData() {
      return this.$store.getters.experienceData;
    },
  },
  created() {
  },
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
/* アクティビティコンテンツ表示欄 */
  .experience__main__wrapper{
    margin-top: 16px;
  }
  .picture__score__wrapper{
    display: flex;
    justify-content: space-between;
    margin-bottom: 30px;
  }
/* アクティビティ画像表示欄 */
  .experience__picture{
    height: 370px;
    width: 490px;
    border: 1px solid #ccc;
  }
  .experience__page__right{
    width: calc(100% - 770px)
  }
</style>
