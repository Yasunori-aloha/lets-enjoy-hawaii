<template>
  <div v-if="$mq !== 'sm'" class="experience__main__wrapper">
    <div class="picture__score__wrapper">
      <ActivityPicture :activity="experienceData" />
      <ScoreDistribution />
    </div>
    <TimeLocation />
  </div>
  <ul v-else style="margin-top: 15px;">
    <li class="main__wrapper__sm">
      <ActivityPicture :activity="experienceData" />
      <router-link :to="`/experiences/${experienceData.id}/photos`" tag="p" class="picture__link__sm">写真をもっと見る({{ experienceData.images_counts }}枚) ></router-link>
    </li>
    <li class="main__wrapper__sm">
      <p class="paragraph__header__sm">口コミ</p>
      <router-link :to="`/experiences/${experienceData.id}/reviews`" tag="div" class="rating__wrapper__sm">
        <span class="rating__all__sm">総合</span>
        <StarRating :margin-left-flag="true" :rating-point-font-size="16" :rating-font-size="24"  :experience="experienceData" />
        <span style="margin-left: 20px;">(</span>
        <span class="review__count__sm">{{ experienceData.reviews_counts }}</span>
        <span style="margin-top: -3px;">件)</span>
        <i class="fas fa-angle-right"></i>
      </router-link>
      <ScoreDistribution />
    </li>
    <li class="main__wrapper__sm">
      <p class="paragraph__header__sm">基本情報</p>
      <TimeLocation />
    </li>
  </ul>
</template>

<script>
import ActivityPicture from '../ActivityPicture.vue';
import ScoreDistribution from '../ExperiencesPage/ScoreDistribution.vue';
import StarRating from '../StarRating.vue';
import TimeLocation from '../ExperiencesPage/TimeLocation.vue';

export default {
  components: {
    ActivityPicture,
    ScoreDistribution,
    StarRating,
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
    height: calc((100vw - 20px) / 4 * 3);
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
  .rating__wrapper__sm{
    display: flex;
    height: 50px;
    padding: 14px 0 0 12px;
    position: relative;
  }
  .rating__all__sm{
    margin-right: 12px;
    font-weight: bold;
  }
  .review__count__sm{
    font-size: 14px;
    margin-top: 3px;
  }
</style>

<style>
  .paragraph__header__sm{
    height: 30px;
    background-color: #FFA500;
    color: white;
    font-weight: bold;
    font-size: 18px;
    padding: 1px 0 0 10px;
  }
</style>
