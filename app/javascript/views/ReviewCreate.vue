<template>

</template>

<script>
export default {
  computed: {
    experienceData() {
      return this.$store.getters.experienceData;
    },
  },
  created() {
    console.log(this.experienceData);
  },
};
</script>

<style scoped>

</style>
