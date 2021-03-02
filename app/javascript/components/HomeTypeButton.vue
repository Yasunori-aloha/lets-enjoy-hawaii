<template>
  <router-link v-if="$mq !== 'sm'" :to="{name: 'search', params:{name: categoryData.categoryUrl[categoryId], case: 'category', id: `${categoryId + 1}`, typeWord: categoryData.categoryName[categoryId] }}" tag="li" class="category">
    <img :src="getImagePath(categoryData.categoryImage[categoryId])" alt="目的アイコン" class="category__icon">
    <p v-if="categoryId === 0 " class="category__name">{{ categoryData.categoryName[categoryId] }}<br>コンドミニアム</p>
    <p v-else class="category__name">{{ categoryData.categoryName[categoryId] }}</p>
  </router-link>
  <router-link v-else :to="{name: 'search', params:{name: categoryData.categoryUrl[categoryId], case: 'category', id: `${categoryId + 1}`, typeWord: categoryData.categoryName[categoryId] }}" tag="li" class="category__sm" :class="{border__right: (categoryId + 1) % 3 != 0}">
    <img :src="getImagePath(categoryData.categoryImage[categoryId])" alt="目的アイコン" class="category__icon__sm">
    <p class="category__name">{{ categoryData.categoryName[categoryId] }}</p>
  </router-link>
</template>

<script>
export default {
  props: {
    categoryId: {
      type: Number,
      required: true,
    },
  },
  computed: {
    categoryData() {
      return this.$store.getters.categoryData;
    },
  },
  methods: {
    getImagePath(categoryImage) {
      return require(`../../assets/images/${categoryImage}.png`)
    }
  },
};
</script>

<style scoped>
  .category{
    height: 68.25px;
    border: 1px solid #000000;
    border-radius: 8px;
    margin: 11px 20px;
    display: flex;
    align-items: center;
    cursor: pointer;
    position: relative;
  }
  .category__link{
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
  }
  .category__icon{
    height: 40px;
    width: 40px;
    margin: 0 10px;
  }
  /* スマホ表示用 */
  .category__sm{
    width: calc(100% / 3);
    font-size: 14px;
    padding: 5px 0;
    border-bottom: solid 1.5px #ccc;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .category__icon__sm{
    height: 40px;
    width: 45px;
    margin-bottom: 5px;
  }
  .border__right{
    border-right: solid 1.5px #ccc;
  }
</style>
