<template>
  <div class="review__wrapper">
    <div class="review__form">
      <form>
        <div class="review__form__tile">
          <div class="review__form__title__wrapper">
            <div class="head__icon"></div>
            <h1 class="head__name">口コミを投稿する</h1>
          </div>
          <div class="review__experience__info">
            <img src="" alt="" class="experience__picture">
            <ul class="experience__name__wrapper">
              <li class="experience__icon__name">
                <img src="" alt="" class="category__icon">
                <span class="experience__name">{{ experienceData.name }}</span>
              </li>
              <li class="experience__area">
                <span>エリア：{{ experienceData.area.island.name }} > {{ experienceData.area.name }}</span>
              </li>
              <li class="experience__address">
                <span>住所：{{ experienceData.address }}</span>
              </li>
            </ul>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    experienceData() {
      return this.$store.getters.experienceData;
    },
  },
  created() {
    console.log(this.experienceData);
  },
};
</script>

<style scoped>
/* 口コミ投稿ページ表示欄 */
  .review__wrapper{
    width: 950px;
    margin: 0 auto 100px;
    display: flex;
    justify-content: space-between;
  }
  .review__form{
    width: 750px;
    color: #333333;
  }
/* 口コミ投稿ページタイトル表示欄 */
  .review__form__tile{
    margin-top: 28px;
  }
  .review__form__title__wrapper{
    display: flex;
  }
  .head__icon{
    height: 22px;
    width: 5px;
    border-radius: 2px;
    background-color: #ff4500;
  }
  .head__name{
    font-size: 18px;
    font-weight: bold;
    margin-left: 8px;
  }
/* アクティビティ情報表示欄 */
  .review__experience__info{
    display: flex;
    margin-top: 27px;
  }
  .experience__picture{
    height: 107px;
    width: 160px;
  }
  .experience__name__wrapper{
    margin-left: 15px;
  }
  .experience__icon__name{
    display: flex;
  }
  .category__icon{

  }
  .experience__name{
    font-weight: bold;
    margin: 5px 0 0 8px;
  }
  .experience__area{
    margin-top: 9px;
    font-size: 11px;
    word-spacing: 0;
  }
  .experience__address{
    margin-top: 5px;
    font-size: 12px;
    word-spacing: 0;
  }
</style>
