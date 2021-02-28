<template>
  <router-link to="/">
    <img :src="lehLogoImage" alt="アイコン画像" class="leh__icon" :class="{leh__icon__sm: $mq === 'sm'}">
  </router-link>
</template>

<script>
export default {
  data() {
    return {
      lehLogoImage: require('../../assets/images/leh_logo.png')
    }
  },
};
</script>

<style scoped>
  .leh__icon{
    height: 80px;
    width: 80px;
    margin-bottom: 5px;
  }
  .leh__icon__sm{
    height: 40px;
    width: 40px;
  }
</style>
