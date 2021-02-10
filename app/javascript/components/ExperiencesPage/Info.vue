<template>
  <div class="experience__info__left">
    <ul>
      <li class="experience__name__wrapper">
        <CategoryIcon :category-name="experienceData.genre.category.search" />
        <h1 class="experinece__name">{{ experienceData.name }}</h1>
      </li>
      <li class="experience__score">
        <StarRating :experience="experienceData" />
      </li>
      <li class="area__island__wrapeer">
        <span class="area__name">エリア</span>
        <router-link :to="{name: 'search', params:{name: experienceData.area.island.search, case: 'island', id: experienceData.area.island.id, typeWord: experienceData.area.island.name }}" class="link__hover area__island">{{ experienceData.area.island.name }}</router-link>
        <router-link :to="{name: 'search', params:{name: experienceData.area.search, case: 'area' }}" class="area search_btn link__hover area__island">{{ experienceData.area.name }}</router-link>
      </li>
      <li class="genre__category__wrapper">
        <span class="genre__name">ジャンル</span>
        <router-link :to="{name: 'search', params:{name: experienceData.genre.category.search, case: 'category'}}" class="category search_btn link__hover genre__category">{{ experienceData.genre.category.name }}</router-link>
        <router-link :to="{name: 'search', params:{name: experienceData.genre.search, case: 'genre'}}" class="genre search_btn link__hover genre__category">{{ experienceData.genre.name }}</router-link>
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
  created() {
    console.log(this.experienceData.area.island.id);
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
