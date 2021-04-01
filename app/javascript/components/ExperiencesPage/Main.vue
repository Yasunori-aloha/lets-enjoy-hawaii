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
      <!-- <ScoreDistribution /> -->
    </li>
    <li class="main__wrapper__sm">
      <p class="paragraph__header__sm">口コミ</p>
      <div class="rating__wrapper__sm">
        <span style="font-weight: bold;">総合</span>
        <StarRating class="test" :experience="experienceData" />
      </div>
    </li>
    <li class="main__wrapper__sm">
      <p class="paragraph__header__sm">基本情報</p>
      <TimeLocation />
    </li>
    <li class="main__wrapper__sm">
      <p class="paragraph__header__sm">関連エリア</p>
      <router-link :to="{name: 'search', params:{name: experienceData.area.island.search, case: 'island', id: experienceData.area.island.id, typeWord: experienceData.area.island.name }}" class="area__genre__sm">
        <span>{{ experienceData.area.island.name }}</span>
        <i class="fas fa-angle-right"></i>
      </router-link>
      <router-link :to="{name: 'search', params:{name: experienceData.area.search, case: 'area', id: experienceData.area.id, typeWord: experienceData.area.name }}" class="area__genre__sm">
        <span>{{ experienceData.area.name }}</span>
        <i class="fas fa-angle-right"></i>
      </router-link>
    </li>
    <li class="main__wrapper__sm">
      <p class="paragraph__header__sm">関連ジャンル</p>
      <router-link :to="{name: 'search', params:{name: experienceData.genre.category.search, case: 'category', id: experienceData.genre.category.id, typeWord: experienceData.genre.category.name }}" class="area__genre__sm">
        <span>{{ experienceData.genre.category.name }}</span>
        <i class="fas fa-angle-right"></i>
      </router-link>
      <router-link :to="{name: 'search', params:{name: experienceData.genre.search, case: 'genre', id: experienceData.genre.id, typeWord: experienceData.genre.name }}" class="area__genre__sm">
        <span>{{ experienceData.genre.name }}</span>
        <i class="fas fa-angle-right"></i>
      </router-link>
    </li>
  </ul>
</template>

<script>
import ActivityPicture from '../ActivityPicture.vue';
import ScoreDistribution from '../ExperiencesPage/ScoreDistribution.vue';
import TimeLocation from '../ExperiencesPage/TimeLocation.vue';
import StarRating from '../StarRating.vue';

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
  .main__wrapper__sm{
    margin-bottom: 20px;
  }
  .main__wrapper__sm a:first-of-type{
    border-bottom: 1px solid #ccc;
  }
  .main__wrapper__sm:nth-child(4){
    margin-bottom: 0px;
  }
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
  .paragraph__header__sm{
    height: 30px;
    background-color: #FFA500;
    color: white;
    font-weight: bold;
    font-size: 18px;
    padding: 1px 0 0 10px;
  }
  .rating__wrapper__sm{
    display: flex;
    height: 50px;
    padding: 14px 0 0 12px;
  }
  .area__genre__sm{
    height: 46px;
    padding: 0 10px;
    font-size: 14px;
    color: #333333;
    text-decoration: none;
    font-weight: bold;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
</style>
