<template>
  <div class="my__page__main__right">
    <div class="my__page__user__info__head">
      <img :src="getUserImage(userData.image_url)" alt="no_image"  class="my__page__user__image">
      <div class="my__page__user__name__area">
        <p class="my__page__user__name1">{{ userData.name }}</p>
        <span class="my__page__user__name2">さんのマイページ</span>
      </div>
    </div>
    <div class="my__page__user__info__main">
      <span>{{ userData.introduce }}</span>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    userData() {
      return this.$store.getters.userData;
    },
  },
  data() {
    return {
      noImage: require('../../../assets/images/no_image.jpg')
    }
  },
  methods: {
    getUserImage(imageUrl) {
      if (imageUrl !== 'null') {
        return imageUrl;
      } else {
        return this.noImage;
      }
    },
  },
};
</script>

<style scoped>
  .my__page__user__info__head{
    min-height: 185px;
    width: 100%;
    background-color: rgba(255, 255, 255, 0.75);
    display: flex;
    margin: 28px 0;
    border-radius: 5px;
  }
  .my__page__user__image{
    height: 150px;
    width: 150px;
    margin: 17px;
    border-radius: 10px;
    border: 1px solid gray;
  }
  .my__page__user__name__area{
    min-height: 150px;
    width: calc(100% - 150px);
    margin: 17px 17px 17px 0;
    color: black;
    text-align: end;
  }
  .my__page__user__name1{
    min-height: calc(100% / 4 * 3);
    line-height: 112px;
    font-size: 60px;
  }
  .my__page__user__name2{
    font-size: 22px;
    line-height: 37px;
  }
  .my__page__user__info__main{
    width: 100%;
    background-color: rgba(255, 255, 255, 0.75);
    margin: 20px 0 28px;
    border-radius: 5px;
    min-height: 250px;
    display: block;
    color: black;
    padding: 25px 17px;
  }
</style>
