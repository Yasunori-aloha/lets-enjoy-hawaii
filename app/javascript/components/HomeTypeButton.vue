<template>
  <li class="type">
    <router-link :to="searchTypeLink" class='type__link'></router-link>
    <img :src="getImagePath(searchTypeImage)" alt="目的アイコン" class="type__icon">
    <p class="type__name">{{ searchTypeName }}<br>{{ searchTypeName2 }}</p>
  </li>
</template>

<script>
export default {
  props: {
    searchTypeLink: {
      type: String,
      required: true,
    },
    searchTypeImage: {
      type: String,
      required: true,
    },
    searchTypeName: {
      type: String,
      required: true,
    },
    searchTypeName2: {
      type: String,
      required: false,
    },
  },
  methods: {
    getImagePath(searchTypeImage) {
      return `/assets/${searchTypeImage}.png`
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
