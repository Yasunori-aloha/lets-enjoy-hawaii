<template>
  <div v-if="$mq !== 'sm'" class="experience__info__right">
    <ul>
      <router-link to="/experience/review" tag="li" class="reviews__share">
        <i class="far fa-comment-dots fa-flip-horizontal"></i>
        <span>口コミ投稿</span>
      </router-link>
      <!-- <li class="reviews__share">
        <i class="fas fa-share"></i>
        <span>シェアする</span>
        <a href="" class="btn"></a>
      </li> -->
    </ul>
    <ul class="favorite__history__wrapper">
      <FavoriteButton />
      <HistoryButton />
    </ul>
  </div>
  <ul v-else class="multi__tab__wrapper__sm">
    <FavoriteButton />
    <HistoryButton />
  </ul>
</template>

<script>
import FavoriteButton from '../ExperiencesPage/FavoriteButton.vue';
import HistoryButton from '../ExperiencesPage/HistoryButton.vue';

export default {
  components: {
    FavoriteButton,
    HistoryButton,
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
    cursor: pointer;
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
/* スマホ表示用 */
  .multi__tab__wrapper__sm{
    padding-right: 10px;
  }
</style>
