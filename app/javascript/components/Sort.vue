<template>
  <ul v-if="isExperiencesPage" class="review__sort">
    <li>並び替え</li>
    <li @click="sortCreatedAt()" class="sort__link" :class="{active__sort: sort.activeSort['createdAt'], link__hover: !sort.activeSort['createdAt']}">投稿日順</li>
    <li @click="sortScore()" class="sort__link" :class="{active__sort: sort.activeSort['score'], link__hover: !sort.activeSort['score']}">評価順</li>
  </ul>
  <ul v-else class="review__sort">
    <li>並び替え</li>
    <li @click="sortScore()" class="sort__link" :class="{active__sort: sort.activeSort['score'], link__hover: !sort.activeSort['score']}">口コミランク順</li>
    <li @click="sortReviewCounts()" class="sort__link" :class="{active__sort: sort.activeSort['reviewCounts'], link__hover: !sort.activeSort['reviewCounts']}">口コミ数順</li>
    <li @click="sortFavoriteCounts()" class="sort__link" :class="{active__sort: sort.activeSort['favoriteCounts'], link__hover: !sort.activeSort['favoriteCounts']}">おすすめ順</li>
  </ul>
</template>

<script>
export default {
  computed: {
    sort() {
      return this.$store.getters.sort;
    },
    isExperiencesPage() {
      return /\/experiences\/\d{1,}\/reviews/.test(this.$route.path) ? true : false;
    },
  },
  methods: {
    sortCreatedAt() {
      this.$store.commit('sortCreatedAt');
    },
    sortScore() {
      const currentPath = this.$route.path
      this.$store.commit('sortScore', currentPath);
    },
    sortReviewCounts() {
      this.$store.commit('sortReviewCounts');
    },
    sortFavoriteCounts() {
      this.$store.commit('sortFavoriteCounts');
    },
  },
};
</script>

<style scoped>
/* 口コミ並び替えボタン表示欄 */
  .review__sort{
    display: flex;
    font-size: 12px;
    margin: 2px 64px 0 0;
  }
  .review__sort > li{
    height: 12px;
    line-height: 12px;
    border-right: 1px solid #ccc;
    padding: 0 5px;
  }
  .sort__link{
    font-weight: normal;
    text-decoration: underline;
  }
  .active__sort{
    color: #000000;
    font-weight: bold;
    text-decoration: none;
    cursor: auto;
  }
</style>
