<template>
  <li class="name">
    <router-link :to="islandNameLink" class='island__name link__hover'>{{ islandName }}島</router-link>
  </li>
</template>

<script>
export default {
  props: {
    islandNameLink: {
      type: String,
      required: true,
    },
    islandName: {
      type: String,
      required: true,
    },
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
</style>
