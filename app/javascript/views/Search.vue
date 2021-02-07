<template>
  <PageMenu />
</template>

<script>
import PageMenu from '../components/ExperiencesPage/PageMenu.vue';

export default {
  components: {
    PageMenu,
  },
  computed: {
    searchData() {
      return this.$store.getters.searchData;
    },
  },
  beforeRouteLeave (to, from, next) {
    this.$store.commit('resetSearchWordScore');
    next();
  }
};
</script>

<style scoped>

</style>
