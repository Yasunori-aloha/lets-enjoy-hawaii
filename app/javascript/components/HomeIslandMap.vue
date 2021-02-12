<template>
  <div class="search__map__main">
    <img :src="mapImageData.mapImages[mapImageData.mapImageIndex]" alt="ハワイ地図" class="islands__image" usemap="#ImageMap1">
    <map name="ImageMap1">
      <IslandArea v-for="(n, index) in 8" :areaId="index" />
    </map>
  </div>
</template>

<script>
import IslandArea from '../components/IslandArea.vue';

export default {
  components: {
    IslandArea,
  },
  computed: {
    mapImageData() {
      return this.$store.getters.mapImageData;
    },
  },
};
</script>

<style scoped>
  .search__map__main{
    padding: 20px 30px;
  }
  .islands__image{
    height: 359px;
    width: 540px;
  }
</style>
