<template>
  <div class="review__form__tile">
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
</style>
