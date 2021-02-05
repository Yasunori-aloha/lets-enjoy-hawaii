<template>
  <div v-if="isExists" class="review__wrapper">
    <div class="review__title__area">
      <div class="review__title__icon"></div>
      <h1 class="review__title">{{ experienceData.name }}の口コミ一覧</h1>
    </div>
    <div class="review__info">
      <div class="review__number">
        <span>1 - {{ experienceData.reviews_counts }}件目</span>
        <span class="review__number__all">(全{{ experienceData.reviews_counts }}件中)</span>
      </div>
      <ul class="review__sort">
        <li>並び替え</li>
        <li @click="sortCreatedAt()" class="sort__link" :class="{active__sort: activeSort['createdAt'], link__hover: !activeSort['createdAt']}">投稿日順</li>
        <li @click="sortScore()" class="sort__link" :class="{active__sort: activeSort['score'], link__hover: !activeSort['score']}">評価順</li>
      </ul>
    </div>
    <ul :class="{active__fade__in: isFadeIn}">
      <li v-for="(review, index) in experienceData.reviews" :key="review.id" class="review__main__wrapper">
        <div class="review__main__area">
          <h2 class="review__main__title">{{ review.title }}</h2>
          <StarRating :score="review.score" />
          <span class="triangle">▲</span>
          <div class="review__comment__area">
            <span>{{  review.comment  }}</span>
          </div>
          <div class="review__user__area">
            <UserImage :image="review.user.image_url" />
            <span class="review__user__name">{{ review.user.name }}さん</span>
          </div>
        </div>
      </li>
    </ul>
  </div>
  <div v-else class="review__wrapper">
    <div class="review__title__area">
      <div class="review__title__icon"></div>
      <h1 class="review__title">{{ experienceData.name }}の口コミはまだありません</h1>
    </div>
  </div>
</template>

<script>
import StarRating from '../StarRating.vue';
import UserImage from '../UserImage.vue';

export default {
  components: {
    StarRating,
    UserImage,
  },
  data() {
    return {
      activeSort: {
        createdAt: true,
        score: false,
      },
      isFadeIn: false,
    }
  },
  computed: {
    experienceData() {
      return this.$store.getters.experienceData;
    },
    isExists() {
      return this.experienceData.reviews_counts !== 0 ? true : false;
    },
  },
  methods: {
    sortCreatedAt() {
      const notSortedYet = !(this.activeSort['createdAt']);
      if (notSortedYet) {
        // 'mapメソッド'を使って'review'と'スコア'が入った配列を作成する。
        let tmp = this.experienceData.reviews.map(review => {
          return {
            review,
            key: review['created_at']
          };
        // 作成した配列内の'スコア'を基に降順ソートしていく。
        }).sort((a,b) =>{
          if (a.key > b.key) {
            return -1;
          } else {
            return 1;
          }
        // ソートした配列から'review'だけを取り出した配列を作成してそれを代入する。
        }).map(sortCreatedAt => {
          return sortCreatedAt.review;
        });

        // 並び替えボタンの表示を変更する。
        this.activeSort['createdAt'] = true;
        this.activeSort['score'] = false;

        this.isFadeIn = true;
        setTimeout(() => {
          this.isFadeIn = false;
        }, 750);

        return this.experienceData.reviews = tmp;
      }
    },
    sortScore() {
      const notSortedYet = !(this.activeSort['score']);
      if (notSortedYet) {
        // 'mapメソッド'を使って'review'と'スコア'が入った配列を作成する。
        let tmp = this.experienceData.reviews.map(review => {
          return {
            review,
            key: review['score']
          };
        // 作成した配列内の'スコア'を基に降順ソートしていく。
        }).sort((a,b) =>{
          if (a.key > b.key) {
            return -1;
          } else {
            return 1;
          }
        // ソートした配列から'review'だけを取り出した配列を作成してそれを代入する。
        }).map(sortScore => {
          return sortScore.review;
        });

        // 並び替えボタンの表示を変更する。
        this.activeSort['createdAt'] = false;
        this.activeSort['score'] = true;

        this.isFadeIn = true;
        setTimeout(() => {
          this.isFadeIn = false;
        }, 750);

        return this.experienceData.reviews = tmp;
      }
    },
  },
};
</script>

<style scoped>
/* アクティビティ口コミ一覧表示欄 */
  .review__wrapper{
    height: 302px;
    height: auto !important;
    min-height: calc(100vh - 495px);
    margin-top: 16px;
  }
/* アクティビティ名称表示欄 */
  .review__title__area{
    display: flex;
  }
  .review__title__icon{
    height: 22px;
    width: 5px;
    border-radius: 2px;
    background-color: #ff4500;
    margin: 1px 5px 0 0;
  }
  .review__title{
    font-size: 18px;
    font-weight: bold;
    color: #333333;
    margin: 0 0 13px 3px;
  }
/* 口コミ件数表示欄 */
  .review__info{
    font-size: 16px;
    padding-bottom: 6px;
    border-bottom: 3px solid #eee;
    word-spacing: 0;
    color:  #333333;
    display: flex;
    justify-content: space-between;
  }
  .review__number{
    display: flex;
  }
  .review__number__all{
    font-size: 12px;
    margin: 4px 0 0 5px;
  }
/* 口コミ並び替えボタン表示欄 */
  .review__sort{
    display: flex;
    font-size: 12px;
    margin: 2px 64px 0 0;
  }
  .review__sort > li{
    height: 12px;
    line-height: 12px;
    border-right: 1px solid #ccc;
    padding: 0 5px;
  }
  .sort__link{
    text-decoration: underline;
    cursor: pointer;
  }
  .active__sort{
    color: #000000;
    font-weight: bold;
    text-decoration: none;
    cursor: auto;
  }
/* 口コミ表示欄 */
  .review__main__wrapper{
    border-bottom: 3px solid #eee;
    padding: 12px 0 15px;
    color: #333333;
  }
  .review__main__area{
    width: 99%;
    margin: 0 auto;
  }
/* 口コミタイトル表示欄 */
  .review__main__title{
    font-size: 14px;
    font-weight: bold;
    color: #0000ff;
    text-decoration: underline;
  }
/* 口コミ本文表示欄 */
  .triangle{
    font-size: 14px;
    margin: -5px 0 0 27px;
    color: #eee;
  }
  .review__comment__area{
    font-size: 20px;
    margin-top: -7px;
    padding: 8px;
    border-radius: 6px;
    background-color: #eee;
  }
/* 口コミ投稿者情報表示欄 */
  .review__user__area{
    display: flex;
    margin-top: 10px;
  }
  .review__user__name{
    font-size: 11px;
    line-height: 32px;
  }
  .user__image {
    height: 30px;
    width: 30px;
    margin-right: 9px;
    background-color: #ccc;
  }
  .active__fade__in {
    animation: fadeOut 0.35s;
    animation: fadeIn 0.35s;
  }
</style>
