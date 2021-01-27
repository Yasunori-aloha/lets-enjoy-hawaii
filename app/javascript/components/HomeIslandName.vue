<template>
  <li class="name name_main">
    <!-- <router-link to="/" class='island__name link__hover'> -->
      <a :href="areaUrl[areaId]" class="island search_btn island_name island__name link__hover" :data-id="areaId" rel="nofollow" data-method="post">
        <span @mouseover="mapChange(areaId)" @mouseleave="mapReturn(8)">{{ areaNames[areaId] }}島</span>
      </a>
    <!-- </router-link> -->
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
      areaUrl: [
        '/niihau' ,
        '/oahu' ,
        '/kahoolawe' ,
        '/lanai' ,
        '/molokai' ,
        '/maui' ,
        '/kauai' ,
        '/hawaii' ,
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
