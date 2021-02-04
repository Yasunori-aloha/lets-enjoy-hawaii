<template>
  <li v-if="experienceData.already_favorited" class="favorite">
    <i class="fas fa-star"></i>
    <a href="" class="btn"></a>
    <span>{{ experienceData.favorite_counts }}</span>
  </li>
  <li v-else class="favorite">
    <i class="far fa-star"></i>
    <a href="" class="btn"></a>
    <span>{{ experienceData.favorite_counts }}</span>
  </li>
</template>

<script>
export default {
  computed: {
    experienceData() {
      return this.$store.getters.experienceData;
    },
  },
};
</script>

<style scoped>
/* お気に入り登録ボタン */
  .favorite{
    height: 25px;
    width: calc((170px - 5px) / 2) ;
    line-height: 25px;
    font-size: 15px;
    border: 1px solid #ccc;
    border-radius: 3px;
    padding-left: 5px;
    position: relative;
    background: linear-gradient(#ffffff, #e4e4e4);
  }
  .fa-star{
    color: #ffa500;
  }
</style>
