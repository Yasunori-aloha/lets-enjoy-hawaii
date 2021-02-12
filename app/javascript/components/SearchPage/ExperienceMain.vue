<template>
  <div class="search__experience__main">
    <ActivityPicture :activity="experience" />
    <div class="experience__outline__wrapper">
      <div class="experience__outline__main link__hover"></div>
      <div class="experience__outline__sub"></div>
      <div class="experience__outline__category">
        <i class="fas fa-flag category__icon"></i>
        <span>{{ experience.genre.name }}</span>
      </div>
      <div class="search__experience__favorites">
        <i class="fas fa-star star__icon"></i>
        <span class="experience__favorite__counts">{{ experience.favorite_counts }}</span>
      </div>
    </div>
  </div>
</template>

<script>
import ActivityPicture from '../../components/ActivityPicture.vue';

export default {
  props: ["experience"],
  components: {
    ActivityPicture,
  },
};
</script>

<style scoped>
/* アクティビティ画像等表示欄 */
  .search__experience__main{
    height: 160px;
    margin: 20px 11px 10px;
    display: flex;
  }
  .experience__picture{
    /* height: 134px;
    width: 178px; */
    height: 150px;
    width: 180px;
    border: 1px solid #ccc;
  }
  .experience__outline__wrapper{
    height: 100%;
    width: 100%;
    margin-left: 11px;
    position: relative;
  }
  .experience__outline__main{
    line-height: 18px;
    margin-bottom: 5px;
    font-size: 14px;
    font-weight: bold;
  }
  .experience__outline__sub{
    line-height: 15px;
    margin-bottom: 8px;
    font-size: 11px;
  }
  .experience__outline__category{
    font-size: 11px;
    margin-bottom: 10px;
  }
  .category__icon{
    color: #ffa500;
  }
/* アクティビティへのお気に入り数表示欄 */
  .search__experience__favorites{
    position: absolute;
    right: 0;
    bottom: 0;
    color: #333333;
    font-size: 22px;
  }
  .star__icon{
    color: #ffa500;
  }
  .experience__favorite__counts{
    font-weight: bold;
    line-height: 26px;
  }
</style>
