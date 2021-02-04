<template>
  <div class="experience__info__right">
    <ul>
      <li class="reviews__share">
        <i class="far fa-comment-dots fa-flip-horizontal"></i>
        <span>口コミ投稿</span>
        <a :href="`/experiences/${experienceData.id}/reviews/new`" class="btn"></a>
      </li>
      <!-- <li class="reviews__share">
        <i class="fas fa-share"></i>
        <span>シェアする</span>
        <a href="" class="btn"></a>
      </li> -->
    </ul>
    <ul class="favorite__history__wrapper">
      <ExperiencesFavoriteButton />
      <li class="history__place">
        <i class="fas fa-shoe-prints fa-rotate-270"></i>
        <a href="" class="btn"></a>
        <span class="history">行った</span>
      </li>
    </ul>
  </div>
</template>

<script>
import ExperiencesFavoriteButton from '../ExperiencesPage/ExperiencesFavoriteButton.vue';

export default {
  components: {
    ExperiencesFavoriteButton,
  },
  computed: {
    experienceData() {
      return this.$store.getters.experienceData;
    },
  },
};
</script>

<style scoped>
/* 口コミやお気に入りボタン表示欄 */
  .experience__info__right{
    height: 140px;
    width: 170px;
    margin: 25px 0;
    color: #333333;
  }
  .reviews__share{
    height: 37px;
    line-height: 37px;
    font-size: 20px;
    border: 1px solid #ccc;
    border-radius: 3px;
    text-align: center;
    margin-bottom: 5px;
    position: relative;
    background: linear-gradient(#ffffff, #e4e4e4);
  }
  .btn{
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
  }
/* お気に入り・訪問記録登録表示欄 */
  .favorite__history__wrapper{
    display: flex;
  }
/* 訪問記録登録ボタン */
  .history__place{
    height: 25px;
    width: calc((170px - 5px) / 2) ;
    line-height: 25px;
    font-size: 15px;
    border: 1px solid #ccc;
    border-radius: 3px;
    padding-left: 5px;
    position: relative;
    background: linear-gradient(#ffffff, #e4e4e4);
    margin-left: 5px;
  }
  .history{
    float: right;
    margin-right: 6px;
  }
</style>
