<template>
  <div v-if="$mq !== 'sm'" class="experience__main__wrapper">
    <div class="picture__score__wrapper">
      <ActivityPicture :activity="experienceData" />
      <ScoreDistribution />
    </div>
    <TimeLocation />
  </div>
  <div v-else style="margin-top: 15px;">
    <div class="picture__wrapper__sm">
      <ActivityPicture :activity="experienceData" />
      <router-link :to="`/experiences/${experienceData.id}/photos`" tag="p" class="picture__link__sm">写真をもっと見る({{ experienceData.images_counts }}枚) ></router-link>
      <!-- <ScoreDistribution /> -->
    </div>
    <!-- <TimeLocation /> -->
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
/* スマホ表示用 */
  .experience__picture__sm{
    height: 174px;
    width: calc(100% - 20px);
    margin: 0 10px 4px;
  }
  .picture__link__sm{
    height: 34px;
    border: 1px solid #ccc;
    margin: 0 10px;
    padding-top: 7px;
    font-size: 13px;
    font-weight: bold;
    text-align: center;
  }
</style>
