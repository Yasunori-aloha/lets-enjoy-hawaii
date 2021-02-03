<template>
  <div>
    <router-view name="header" />
    <ExperiencesPageMenu />
    <router-view name="footer" />
  </div>
</template>

<script>
import ExperiencesPageMenu from '../components/ExperiencesPage/ExperiencesPageMenu.vue';
export default {
  components: {
    ExperiencesPageMenu,
  }
};
</script>

<style scoped>

</style>
