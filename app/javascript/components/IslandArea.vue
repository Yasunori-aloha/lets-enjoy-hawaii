<template>
  <area @click="searchIsland(areaId)" class="island__area" shape="poly" :coords="islandData.areas[areaId]" @mouseover="mapChange(areaId)" @mouseleave="mapReset">
</template>

<script>
import { mapMutations } from "vuex";

export default {
  props: {
    areaId: {
      type: Number,
      required: true,
    },
  },
  computed: {
    islandData() {
      return this.$store.getters.islandData;
    },
  },
  methods: {
    ...mapMutations(["mapChange", "mapReset"]),
    searchIsland(areaId) {
      this.$router.push({
        name: 'search',
        params: {
              name: this.islandData.islandUrl[areaId],
              case: 'island',
                id: `${areaId + 1}`,
          typeWord: this.islandData.islandNames[areaId]
        }
      });
    },
  },
};
</script>

<style scoped>
  .island__area{
    cursor: pointer;
  }
</style>
