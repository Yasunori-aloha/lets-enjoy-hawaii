<template>
  <div v-if="$mq !== 'sm'" class="review__form__tile">
    <div class="review__form__title__wrapper">
      <div class="head__icon"></div>
      <h1 class="head__name">口コミを投稿する</h1>
    </div>
    <div class="review__experience__info">
      <ActivityPicture :activity="experienceData" />
      <ul class="experience__name__wrapper">
        <li class="experience__icon__name">
          <CategoryIcon :category-name="experienceData.genre.category.search" />
          <span class="experience__name">{{ experienceData.name }}</span>
        </li>
        <li class="experience__area">
          <span>エリア：{{ experienceData.area.island.name }} > {{ experienceData.area.name }}</span>
        </li>
        <li class="experience__address">
          <span>住所：{{ experienceData.address }}</span>
        </li>
      </ul>
    </div>
  </div>
  <div v-else>
    <div class="review__form__title__wrapper__sm">
      <div class="head__icon__sm"></div>
      <h1 class="head__name__sm">口コミを投稿する</h1>
    </div>
    <ul class="experience__name__wrapper__sm">
      <li class="experience__area__sm">
        <span>エリア：{{ experienceData.area.island.name }} > {{ experienceData.area.name }}</span>
      </li>
      <li class="experience__icon__name__sm">
        <span>{{ experienceData.name }}</span>
      </li>
    </ul>
  </div>
</template>

<script>
import ActivityPicture from '../../components/ActivityPicture.vue';
import CategoryIcon from '../../components/CategoryIcon.vue';

export default {
  components: {
    ActivityPicture,
    CategoryIcon,
  },
  computed: {
    experienceData() {
      return this.$store.getters.experienceData;
    },
  },
};
</script>

<style scoped>
/* 口コミ投稿ページタイトル表示欄 */
  .review__form__tile{
    margin-top: 28px;
  }
  .review__form__title__wrapper{
    display: flex;
  }
  .head__icon{
    height: 22px;
    width: 5px;
    border-radius: 2px;
    background-color: #ff4500;
  }
  .head__name{
    font-size: 18px;
    font-weight: bold;
    margin-left: 8px;
  }
/* アクティビティ情報表示欄 */
  .review__experience__info{
    display: flex;
    margin-top: 27px;
  }
  .experience__picture{
    height: 107px;
    width: 160px;
  }
  .experience__name__wrapper{
    margin-left: 15px;
  }
  .experience__icon__name{
    display: flex;
  }
  .experience__name{
    font-weight: bold;
    margin: 5px 0 0 8px;
  }
  .experience__area{
    margin-top: 9px;
    font-size: 11px;
    word-spacing: 0;
  }
  .experience__address{
    margin-top: 5px;
    font-size: 12px;
    word-spacing: 0;
  }
/* スマホ表示用 */
  .review__form__title__wrapper__sm{
    width: 100%;
    padding: 32px 0 0 10px;
    display: flex;
  }
  .head__icon__sm{
    height: 19px;
    width: 7px;
    margin-right: 6px;
    background-color: #FF4500;
  }
  .head__name__sm{
    font-size: 19px;
    font-weight: bold;
    line-height: 18px;
  }
  .experience__name__wrapper__sm{
    padding: 14px 0 0 10px
  }
  .experience__area__sm{
    font-size: 11px;
  }
  .experience__icon__name__sm{
    padding-top: 2px;
    font-size: 17px;
    font-weight: bold;
  }
</style>
