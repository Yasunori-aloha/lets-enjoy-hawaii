<template>
  <div class="experience__page__menu">
    <div>
      <router-link to="/" class="link__hover">トップページ</router-link>
      <span> › </span>
      <a href="/" class="link__hover" rel="nofollow" data-method="post">{{ experienceData.genre.category.name }}</a>
      <span> › {{ experienceData.name }}</span>
    </div>
  </div>
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
  .experience__page__menu{
    width: 950px;
    font-size: 10px;
    margin: 0 auto;
    padding: 10px 0 5px 0;
    border-bottom: 1px dotted black;
    text-align: left;
  }
</style>
