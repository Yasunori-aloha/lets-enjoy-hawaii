<template>
  <ul class="order">
    <li>並び順：</li>
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
  },
  methods: {
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
/* 検索結果並び順変更ボタン表示欄 */
  .order{
    display: flex;
    align-items: center;
    padding: 0 5px;
  }
  .sort__link{
    height: 12px;
    line-height: 12px;
    margin-left: 5px;
    padding-right: 6px;
    border-right: 1px solid #ccc;
    text-decoration: underline;
  }
  .active__sort{
    color: #000000;
    font-weight: bold;
    text-decoration: none;
    cursor: auto;
  }
</style>
