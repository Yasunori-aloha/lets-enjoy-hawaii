<template>
  <h1>test</h1>
</template>

<script>
export default {
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
