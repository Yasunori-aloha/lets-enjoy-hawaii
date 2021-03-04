<template>
  <li v-if="$mq !== 'sm'" class="name">
    <router-link :to="{name: 'search', params:{name: islandData.islandUrl[areaId], case: 'island', id: `${areaId + 1}`, typeWord: islandData.islandNames[areaId] }}" class='island__name link__hover'>
      <span @mouseover="mapChange(areaId)" @mouseleave="mapReset">{{ islandData.islandNames[areaId] }}</span>
    </router-link>
  </li>
  <li v-else class="name__sm" :class="{border__right: (areaId + 1) <= 4}">
    <router-link :to="{name: 'search', params:{name: islandData.islandUrl[areaId], case: 'island', id: `${areaId + 1}`, typeWord: islandData.islandNames[areaId] }}" class='island__name__sm link__hover'>
      <span>{{ islandData.islandNames[areaId] }}</span>
    </router-link>
  </li>
</template>

<script>
import { mapMutations } from "vuex";

export default {
  data() {
    return {
    }
  },
  props: {
    areaId: {
      type: Number,
      required: true,
    }
  },
  computed: {
    islandData() {
      return this.$store.getters.islandData;
    },
  },
  methods: {
    ...mapMutations(["mapChange", "mapReset"]),
  },
};
</script>

<style scoped>
  .name{
    height: 39px;
    width: 140px;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .island__name{
    color: black;
    font-size: 18px;
  }
  .island__name > span{
    display: block;
    height: 100%;
    width: 100%;
  }
  .name__sm{
    border-bottom: solid 1.5px #ccc;
    font-size: 18px;
    text-align: center;
  }
  .island__name__sm{
    color: black;
  }
</style>
