<template>
  <img :src="categoryIcon(categoryName)" class="category__icon">
</template>

<script>
export default {
  props: ["categoryName"],
  methods: {
    categoryIcon(categoryName) {
      return require(`../../assets/images/${categoryName}_icon.png`);
    },
  },
};
</script>

<style scoped>
  .category__icon{
    height: 35px;
    width: 35px;
  }
</style>
