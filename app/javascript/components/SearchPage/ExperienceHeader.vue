<template>
    <div class="search__experience__header">
      <div>
        <router-link :to="`/experiences/${experience.id}`" class="show__experiences link__hover">{{ experience.name }}</router-link>
      </div>
      <StarRating :experience="experience" />
      <p class="search__experience__location">{{ experience.area.island.name }} > {{ experience.area.name }}</p>
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
</style>
