<template>
  <img :src="categoryIcon(categoryName)" :class="{category__icon: $mq !== 'sm', category__icon__sm: $mq === 'sm'}">
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
  .category__icon__sm{
    height: 25px;
    width: 25px;
  }
</style>
