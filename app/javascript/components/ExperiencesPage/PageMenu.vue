<template>
  <div v-if="isSearchPage" class="experience__page__menu">
    <div>
      <router-link to="/" class="link__hover">トップページ</router-link>
      <span> › </span>
      <span>評価点 {{ searchData.score }}点以上で、" {{ searchData.word }} "の検索結果</span>
    </div>
  </div>
  <div v-else class="experience__page__menu">
    <div>
      <router-link to="/" class="link__hover">トップページ</router-link>
      <span> › </span>
      <a :href="`/${experienceData.genre.category.search}`" class="link__hover" rel="nofollow" data-method="post">{{ experienceData.genre.category.name }}</a>
      <span> › {{ experienceData.name }}</span>
    </div>
    <span id="category_id" style="display: none;">{{ experienceData.genre.category.id }}</span>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  computed: {
    ...mapGetters(["experienceData", "searchData"]),
    isSearchPage() {
      return /\/search/.test(this.$route.path) ? true : false;
    },
  },
  created() {
    console.log(this.searchData);
  },
};
</script>

<style scoped>
  .experience__page__menu{
    width: 950px;
    font-size: 10px;
    margin: 0 auto;
    padding: 10px 0 5px 0;
    border-bottom: 1px dotted black;
    text-align: left;
  }
</style>
