<template>
  <div class="search__wrapper">
    <div class="search__main__left">
      <div class="search__main__left__header">
        <h1 class="search__main__title">" {{ searchData.word }} "が含まれるスポット</h1>
      </div>
      <div class="search__main__left__info">
        <div class="search__main__left__info__up">
          <ul class="ul__number">
            <li>1 - {{ experiencesList.length }}件</li>
            <li class="all__number">（全{{ experiencesList.length }}件中）</li>
          </ul>
          <!-- <ul class="ul__list">
            <li class="list list__active">
              <i class="fas fa-list"></i>
            </li>
            <li class="list">
              <i class="fas fa-th"></i>
            </li>
          </ul> -->
        </div>
        <div class="search__main__left__info__down">
          <ul class="order">
            <li>並び順：</li>
            <li class="sort__link link__hover">口コミランク順</li>
            <li class="sort__link active__sort">おすすめ順</li>
          </ul>
        </div>
      </div>
      <ul>
        <li v-for="(experience, index) in experiencesList" :key="experience.id" class="search__experience__list">
          <ExperienceHeader :experience="experience" />
          <ExperienceMain :experience="experience" />
        </li>
      </ul>
    </div>
    <div class="search__main__right">
      <!-- <div class="search__right__area">
        <h2 class="right__area__title">最近のお気に入りスポット</h2>
        <div class="right__area__main">
          <img src="" class="favorite__image">
          <p class="favorite__name link__hover">テスト</p>
        </div>
        <div class="right__area__sub">
          <img src="" class="favorite__image">
          <p class="favorite__name__sub link__hover">テスト</p>
        </div>
      </div> -->
    </div>
  </div>
</template>

<script>
import ExperienceHeader from '../components/SearchPage/ExperienceHeader.vue';
import ExperienceMain from '../components/SearchPage/ExperienceMain.vue';
import { mapGetters } from "vuex";

export default {
  components: {
    ExperienceHeader,
    ExperienceMain,
  },
  computed: {
    ...mapGetters(["searchData", "experiencesList"]),
  },
  beforeRouteLeave (to, from, next) {
    this.$store.commit('resetSearchWordScore');
    next();
  },
};
</script>

<style scoped>
/* 検索結果ページ表示欄 */
  .search__wrapper{
    min-height: calc(100vh - 216px);
    height: 100%;
    display: flex;
    justify-content: center;
  }
  .search__main__left{
    width: 740px;
  }
  .search__main__left__header{
    display: flex;
    padding-top: 5px;
    margin-bottom: 23px;
  }
  .search__main__title{
    font-size: 24px;
    font-weight: bold;
    color: #333333;
    line-height: 40px;
    padding-left: 3px;
  }
/* 検索結果ページ内件数表示欄 */
  .search__main__left__info{
    height: 50px;
    color: #333333;
    margin-bottom: 10px;
  }
  .search__main__left__info__up{
    height: 29px;
    display: flex;
    justify-content: space-between;
  }
  .ul__number{
    display: flex;
    align-items: flex-end;
  }
  .all__number{
    font-size: 12px;
    margin-bottom: 2px;
  }
  .ul__list{
    width: 100px;
    display: flex;
    align-items: flex-end;
    justify-content: flex-end;
  }
  .list{
    width: 24px;
    margin: 0 0 5px 8px;
    text-align: center;
    border-radius: 3px;
    background-color: #969696;
    color: white;
    cursor: pointer;
  }
  .list__active{
    background-color: #333333;
  }
/* 検索結果並び順変更ボタン表示欄 */
  .search__main__left__info__down{
    height: 14px;
    font-size: 12px;
    padding-top: 5px;
  }
  .order{
    display: flex;
    align-items: center;
    padding: 0 5px;
  }
  .sort__link{
    height: 12px;
    line-height: 12px;
    margin-left: 5px;
    padding-right: 6px;
    border-right: 1px solid #ccc;
    text-decoration: underline;
  }
  .active__sort{
    color: #000000;
    font-weight: bold;
    text-decoration: none;
    cursor: auto;
  }
/* アクティビティ表示欄 */
  .search__experience__list{
    margin-bottom: 15px;
    border-radius: 10px;
    border: 1px solid #ccc;
  }
/* 検索結果ページ右側要素表示欄 */
  .search__main__right{
    width: 210px;
  }
  .search__right__area{
    width: 180px;
    margin: 74px 0 0 auto;
    padding-top: 4px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }
  .right__area__title{
    margin: 4px 0 9px 5px;
    padding: 0 3px;
    border-left: 4px solid #ffa500;
    font-size: 12px;
    font-weight: bold;
    color: #333333;
  }
  .right__area__main{
    height: 38px;
    margin: 3px 0 7px;
    padding: 0 5px;
    display: flex;
  }
  .favorite__name{
    margin-top: 10px;
    font-size: 12px;
    font-weight: bold;
  }
  .right__area__sub{
    height: 47px;
    margin: 7px 0;
    padding: 9px 5px 0;
    border-top: 1px dotted #ccc;
    display: flex;
  }
  .favorite__image{
    height: 38px;
    width: 51px;
    margin-right: 4px;
  }
  .favorite__name__sub{
    line-height: 14px;
    margin-top: 4px;
    font-size: 12px;
    font-weight: bold;
  }
</style>
