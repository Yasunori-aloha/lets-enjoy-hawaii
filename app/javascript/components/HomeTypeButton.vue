<template>
  <li class="type search_type_main">
    <!-- <router-link :to="typeUrl[typeId]" class='type__link'></router-link> -->
    <a :href="typeUrl[typeId]" class="category search_btn type__link" rel="nofollow" data-method="post"></a>
    <img :src="getImagePath(typeImage[typeId])" alt="目的アイコン" class="type__icon">
    <p v-if="typeId === 0 " class="type__name">{{ typeName[typeId] }}<br>コンドミニアム</p>
    <p v-else class="type__name">{{ typeName[typeId] }}</p>
  </li>
</template>

<script>
export default {
  props: {
    typeId: {
      type: Number,
      required: true,
    },
  },
  data() {
    return {
      typeImage: [
        'hotel_icon',
        'lunch_icon',
        'car_icon',
        'leisure_icon',
        'landmark_icon',
        'shopping_icon',
      ],
      typeName: [
        'ホテル',
        '食事',
        'レンタカー',
        '遊び・体験',
        '観光地',
        'ショッピング',
        'コンドミニアム',
      ],
      typeUrl: [
        '/hotel',
        '/dinner',
        '/rentacar',
        '/leisure',
        '/landmark',
        '/shopping',
      ],
    }
  },
  methods: {
    getImagePath(typeImage) {
      return `/assets/${typeImage}.png`
    }
  },
};
</script>

<style scoped>
  .type{
    height: 68.25px;
    border: 1px solid #000000;
    border-radius: 8px;
    margin: 11px 20px;
    display: flex;
    align-items: center;
    cursor: pointer;
    position: relative;
  }
  .type__link{
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
  }
  .type__icon{
    height: 40px;
    width: 40px;
    margin: 0 10px;
  }
</style>
