<template>
  <div v-if="isExperiencesPage" class="experience__page__menu">
    <div>
      <router-link to="/" class="link__hover">トップページ</router-link>
      <span> › </span>
      <router-link :to="{name: 'search', params:{name: experienceData.genre.category.search, case: 'category'}}" class="link__hover">{{ experienceData.genre.category.name }}</router-link>
      <span> › {{ experienceData.name }}</span>
    </div>
    <span id="category_id" style="display: none;">{{ experienceData.genre.category.id }}</span>
  </div>
  <div v-else class="experience__page__menu">
    <div>
      <router-link to="/" class="link__hover">トップページ</router-link>
      <span> › </span>
      <span v-if="isWordSearchPage">評価点 {{ searchData.score }}点以上で、" {{ searchData.word }} "が含まれる検索結果</span>
      <span v-else="condition">{{ searchData.typeWord }}</span>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  computed: {
    ...mapGetters(["experienceData", "searchData", "categoryData"]),
    isExperiencesPage() {
      return /\/experiences\/\d{1,}/.test(this.$route.path) ? true : false;
    },
    isWordSearchPage() {
      return /\/search/.test(this.$route.path) ? true : false;
    },
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
