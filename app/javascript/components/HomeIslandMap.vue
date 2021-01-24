<template>
  <div class="search__map__main">
    <img :src="mapImages[mapImageIndex]" alt="ハワイ地図" class="islands__image" usemap="#ImageMap1">
    <map name="ImageMap1">
      <IslandArea v-for="(n, index) in 8" :areaId="index" />
    </map>
  </div>
</template>

<script>
import IslandArea from '../components/IslandArea.vue'
export default {
  data() {
    return {
      mapImages: [
        '/images/hawaiian_islands_niihau.png',
        '/images/hawaiian_islands_oahu.png',
        '/images/hawaiian_islands_kahoolawe.png',
        '/images/hawaiian_islands_lanai.png',
        '/images/hawaiian_islands_molokai.png',
        '/images/hawaiian_islands_maui.png',
        '/images/hawaiian_islands_kauai.png',
        '/images/hawaiian_islands_island_of_hawaii.png',
        '/images/hawaiian_islands.png'
      ],
    }
  },
  computed: {
    mapImageIndex() {
      return this.$store.getters.mapImageIndex;
    },
  },
  components: {
    IslandArea,
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
