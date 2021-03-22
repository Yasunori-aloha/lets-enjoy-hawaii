<template>
  <div v-if="$mq !== 'sm'" class="search__experience__header">
    <div>
      <router-link :to="`/experiences/${experience.id}`" class="show__experiences link__hover">{{ experience.name }}</router-link>
    </div>
    <StarRating :experience="experience" />
    <p class="search__experience__location">{{ experience.area.island.name }} > {{ experience.area.name }}</p>
  </div>
  <div v-else class="search__experience__header__sm">
    <router-link :to="`/experiences/${experience.id}`" class="show__experiences__sm link__hover">{{ experience.name }}</router-link>
    <p class="search__experience__location__sm">{{ experience.area.island.name }} > {{ experience.area.name }}</p>
    <StarRating :experience="experience" />
  </div>
</template>

<script>
import StarRating from '../StarRating.vue';

export default {
  props: ["experience"],
  components: {
    StarRating,
  },
};
</script>

<style scoped>
/* アクティビティ表示欄 */
  .search__experience__header{
    height: 87px;
    padding: 10px 0;
    margin: 0 10px;
    border-bottom: 2px dotted #ccc;
  }
  .show__experiences{
    font-size: 18px;
    font-weight: bold;
  }
  .search__experience__location{
    margin-top: -4px;
    font-size: 12px;
  }
  /* スマホ表示用 */
  .search__experience__header__sm{
    min-height: 69px;
    padding-top: 3px;
    margin: 0 10px;
    border-bottom: 1px dotted #ccc;
  }
  .show__experiences__sm{
    font-size: 14px;
    font-weight: bold;
  }
  .search__experience__location__sm{
    margin-top: -3px;
    font-size: 10px;
  }
</style>
