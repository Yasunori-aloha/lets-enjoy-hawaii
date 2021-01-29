<template>
  <div class="my__page__image">
    <div class="my__page__wrapper">
      <div class="my__page__head"></div>
      <div class="my__page__main"></div>
    </div>
  </div>
</template>

<script>
export default {

};
</script>

<style scoped>
/* 背景 */
.my__page__image{
  background-attachment: fixed;
  background-image: url('/assets/mypage_image.jpg');
  background-position: center center;
  background-repeat: no-repeat;
  background-size: cover;
  height: 100%;
  min-height: calc(100vh - 185px);
  width: 100%;
}
.my__page__wrapper{
  background-color: rgba(0, 0, 0, 0.5);
  min-height: calc(100vh - 185px);
}
</style>
