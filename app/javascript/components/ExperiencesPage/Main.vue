<template>
  <div class="experience__main__wrapper">
    <div class="picture__score__wrapper">
      <ActivityPicture :activity="experienceData" />
      <ScoreDistribution />
    </div>
    <TimeLocation />
  </div>
</template>

<script>
import ActivityPicture from '../ActivityPicture.vue';
import ScoreDistribution from '../ExperiencesPage/ScoreDistribution.vue';
import TimeLocation from '../ExperiencesPage/TimeLocation.vue';

export default {
  components: {
    ActivityPicture,
    ScoreDistribution,
    TimeLocation,
  },
  computed: {
    experienceData() {
      return this.$store.getters.experienceData;
    },
  },
};
</script>

<style scoped>
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
</style>
