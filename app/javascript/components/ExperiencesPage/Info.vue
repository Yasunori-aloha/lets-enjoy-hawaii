<template>
  <div class="experience__info__left">
    <ul>
      <li class="experience__name__wrapper">
        <CategoryIcon :category-name="experienceData.genre.category.search" />
        <h1 class="experinece__name">{{ experienceData.name }}</h1>
      </li>
      <li class="experience__score">
        <StarRating :score="experienceData.score" />
        <span class="review__counts">（</span>
        <a href="" class="review__link review__counts link__hover">口コミ{{ experienceData.reviews_counts }}件</a>
        <span class="review__counts">）</span>
      </li>
      <li class="area__island__wrapeer">
        <span class="area__name">エリア</span>
        <a href="/" class="island search_btn link__hover area__island">{{ experienceData.area.island.name }}</a>
        <a href="/" class="area search_btn link__hover area__island">{{ experienceData.area.name }}</a>
      </li>
      <li class="genre__category__wrapper">
        <span class="genre__name">ジャンル</span>
        <a href="" class="category search_btn link__hover genre__category">{{ experienceData.genre.category.name }}</a>
        <a href="" class="genre search_btn link__hover genre__category">{{ experienceData.genre.name }}</a>
      </li>
    </ul>
  </div>
</template>

<script>
import CategoryIcon from '../CategoryIcon.vue';
import StarRating from '../StarRating.vue';

export default {
  components: {
    CategoryIcon,
    StarRating,
  },
  computed: {
    experienceData() {
      return this.$store.getters.experienceData;
    },
  },
};
</script>

<style scoped>
  .experience__info__left{
    width: 500px;
    margin: 25px 0;
    color: #333333;
  }
/* アクティビティ名称表示欄 */
  .experience__name__wrapper{
    display: flex;
  }
  .experinece__name{
    font-size: 24px;
    font-weight: bold;
    margin: -1px 0 0 3px;
  }
/* アクティビティのレーティング表示欄 */
  .experience__score{
    padding-top: 5px;
    display: flex;
  }
/* 口コミ件数表示欄 */
  .review__counts{
    color: black;
    font-weight: unset;
    font-size: 12px;
    line-height: 25px;
  }
  .review__link{
    color: blue;
  }
/* アクティビティのエリア表示欄 */
  .area__island__wrapeer{
    display: flex;
    font-size: 12px;
    margin-top: 12px;
  }
  .area__name{
    font-weight: bold;
    margin-right: 40px;
  }
  .area__island{
    margin: -1px 6px 0 8px;
  }
/* アクティビティのジャンル表示欄 */
  .genre__category__wrapper{
    display: flex;
    font-size: 12px;
    margin-top: 5px;
  }
  .genre__name{
    font-weight: bold;
    margin-right: 29px;
  }
  .genre__category{
    margin: -1px 6px 0 8px;
  }
</style>
