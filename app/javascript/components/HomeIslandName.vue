<template>
  <li class="name">
    <router-link to="/" class='island__name link__hover'>
      <span @mouseover="mapChange(areaId)" @mouseleave="mapReturn(8)">{{ areaNames[areaId] }}島</span>
    </router-link>
  </li>
</template>

<script>
import { mapMutations } from "vuex";

export default {
  data() {
    return {
      areaNames: [
        'ニイハウ',
        'オアフ',
        'カホオラウェ',
        'ラナイ',
        'モロカイ',
        'マウイ',
        'カウアイ',
        'ハワイ',
      ],
    }
  },
  props: {
    areaId: {
      type: Number,
      required: true,
    }
  },
  methods: {
    ...mapMutations(["mapChange", "mapReturn"]),
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
</style>
