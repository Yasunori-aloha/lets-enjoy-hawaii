<template>
  <ul class="experience__tabs__wrapper">
    <router-link :to="`/experiences/${experienceData.id}`" tag="li" class="tab" :class="{active__tab: mainPath}" >
      <span>概要</span>
    </router-link>
    <router-link :to="`/experiences/${experienceData.id}/reviews`" tag="li" class="two__line__tab" :class="{active__tab: reviewPath}">
      <span>口コミ</span>
      <br>
      <span class="number">({{ experienceData.reviews_counts }}件)</span>
    </router-link>
    <router-link :to="`/experiences/${experienceData.id}/photos`" tag="li" class="two__line__tab" :class="{active__tab: photoPath}">
      <span>写真</span>
      <br>
      <span class="number">({{ experienceData.images_counts }}枚)</span>
    </router-link>
  </ul>
</template>

<script>
export default {
  data() {
    return {
      mainPath: false,
      reviewPath: false,
      photoPath: false,
    }
  },
  computed: {
    experienceData() {
      return this.$store.getters.experienceData;
    },
  },
  watch: {
    $route(to, from) {
      const toPath = to.fullPath;
      if (/^\/experiences\/\d{1,}$/.test(toPath)) {
        this.reviewPath = false;
        this.photoPath = false;
        return this.mainPath = true;
      } else if (/^\/experiences\/\d{1,}\/reviews$/.test(toPath)) {
        this.mainPath = false;
        this.photoPath = false;
        return this.reviewPath = true;
      } else {
        this.mainPath = false;
        this.reviewPath = false;
        return this.photoPath = true;
      }
    },
  },
  created() {
    const currentPath = this.$route.path;
    if (/^\/experiences\/\d{1,}$/.test(currentPath)) {
      return this.mainPath = true;
    } else if (/^\/experiences\/\d{1,}\/reviews$/.test(currentPath)) {
      return this.reviewPath = true;
    } else {
      return this.photoPath = true;
    }
  },
};
</script>

<style scoped>
/* アクティビティ表示部分切り替えタブ表示欄 */
  .experience__tabs__wrapper{
    display: flex;
    height: 43px;
    border-bottom: 2px solid #ffa500;
    padding: 0 12px;
  }
  .tab{
    height: 43px;
    width: 86px;
    line-height: 15px;
    border: 2px solid #ccc;
    border-bottom: 2px solid #ffa500;
    border-radius: 4px 4px 0 0;
    margin-right: 4px;
    padding: 12px 0 0;
    font-size: 12px;
    color: #333333;
    text-align: center;
    cursor: pointer;
    position: relative;
  }
  .two__line__tab{
    height: 43px;
    width: 86px;
    line-height: 15px;
    border: 2px solid #ccc;
    border-bottom: 2px solid #ffa500;
    border-radius: 4px 4px 0 0;
    margin-right: 4px;
    padding: 6px 0 0;
    font-size: 12px;
    color: #333333;
    text-align: center;
    cursor: pointer;
  }
  .number{
    font-size: 11px;
  }
/* 選択されているタブ表示欄 */
  .active__tab{
    border: 2px solid #ffa500;
    border-bottom: 2px solid #ffffff;
    color: orangered;
    font-weight: bold;
    cursor: auto;
  }
</style>
