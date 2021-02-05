<template>
  <div class="photo__wrapper">
    <div class="photo__title__area">
      <div class="photo__title__icon"></div>
      <h1 class="photo__title__area">{{ experienceData.name }}の写真一覧</h1>
    </div>
    <div class="photo__info">
      <div class="photo__number">
        <span class="photo__number__part">1 - {{ experienceData.images_counts }}枚目</span>
        <span class="photo__number__all">(全{{ experienceData.images_counts }}枚中)</span>
      </div>
    </div>
    <div class="photo__list">
      <img v-for="(image, index) in images" :key="image" :src="image" :style="isNotRight(index + 1)" class="photo">
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      images: [],
    }
  },
  computed: {
    experienceData() {
      return this.$store.getters.experienceData;
    },
  },
  methods: {
    isNotRight(index) {
      if (index % 3 !== 0) {
        return {
          '--margin-right': '22px',
        };
      } else {
        return {
          '--margin-right': '0px',
        };
      }
    },
  },
  created() {
    this.experienceData.reviews.forEach(e => {
      e.images_url.forEach(image => {
        this.images.push(image);
      });
    });
  },
};
</script>

<style scoped>
/* アクティビティ写真一覧表示欄 */
  .photo__wrapper{
    height: 302px;
    height: auto !important;
    min-height: calc(100vh - 495px);
    margin-top: 16px;
  }
/* アクティビティ名称表示欄 */
  .photo__title__area{
    display: flex;
  }
  .photo__title__icon{
    height: 22px;
    width: 5px;
    border-radius: 2px;
    background-color: #ff4500;
    margin: 1px 5px 0 0;
  }
  .photo__title__area{
    font-size: 18px;
    font-weight: bold;
    color: #333333;
    margin: 0 0 13px 3px;
  }
/* 写真枚数表示欄 */
  .photo__info{
    display: flex;
    justify-content: space-between;
    word-spacing: 0;
    color:  #333333;
    border-bottom: 3px solid #eee;
    padding-bottom: 6px;
    margin-bottom: 10px
  }
  .photo__number{
    display: flex;
  }
  .photo__number__part{
    font-size: 16px;
  }
  .photo__number__all{
    font-size: 12px;
    margin: 4px 0 0 5px;
  }
  .photo__list{
    display: flex;
    flex-wrap: wrap;
    padding: 3px;
  }
  .photo{
    height: 171px;
    width: 228px;
    margin: 0 0 26px 0;
    border: 1px solid $gray;
    margin-right: var(--margin-right);
  }
</style>
