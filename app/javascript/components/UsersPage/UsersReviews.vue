<template>
  <div class="my__page__main__right">
    <div class="user__reviews__wrapper">
      <UsersPageMenu currentPage="今までの口コミ" />
      <div class="user__reviews__show__area">
        <ul v-if="reviewsIsExists">
          <li v-for="(review, index) in userReviews" class="reviews__wrapper">
            <div class="review__main__area">
              <ul class="review__info__wrapper">
                <li>
                  <router-link :to="`/experiences/${review.experience.id}`">
                    <ActivityPicutre :activity="review" />
                  </router-link>
                </li>
                <li>
                  <router-link :to="`/experiences/${review.experience.id}`" class="activity__name link__hover">{{ review.experience.name }}</router-link>
                  <p class="activity__place">{{ review.experience.area.island.name }} > {{ review.experience.area.name }}</p>
                </li>
                <li class="reviewed__at__wrapper">
                    <p >投稿日：</p>
                    {{ reviewTime(review) }}
                </li>
              </ul>
              <div>
                <h2 class="review__title">{{ review.title }}</h2>
                <StarRating :experience="review" :unnecessaryReviewCounts="true" />
              </div>
              <span class="triangle">▲</span>
              <div class="review__comment__area">
                <span class="review__comment">{{ review.comment }}</span>
              </div>
            </div>
          </li>
        </ul>
        <span v-else class="not__contents">まだ口コミを投稿していません。</span>
      </div>
    </div>
  </div>
</template>

<script>
import UsersPageMenu from '../UsersPage/UsersPageMenu.vue';
import ActivityPicutre from '../ActivityPicture.vue';
import StarRating from '../StarRating.vue';
import { mapGetters } from "vuex";

export default {
  components: {
    UsersPageMenu,
    ActivityPicutre,
    StarRating,
  },
  computed: {
    ...mapGetters(["userReviews"]),
    reviewsCounts() {
      return this.$store.getters.userData.reviews_counts;
    },
    reviewsIsExists() {
      return this.reviewsCounts !== 0;
    },
  },
  methods: {
    reviewTime(review) {
      return review.created_at.slice(0, 10).replace(/-/g, '/');
    },
  },
};
</script>

<style scoped>
  .user__reviews__wrapper{
    height: 100%;
    width: 776px;
    margin: 28px 0;
    padding: 0 17px;
    border-radius: 5px;
    color: black;
    display: block;
    background-color: rgba(255, 255, 255, 0.75);
  }
  .user__reviews__show__area{
    min-height: calc(100vh - 386px);
    padding-bottom: 17px;
  }
/* 訪問記録一覧 */
  .reviews__wrapper{
    padding: 12px 0 15px;
    color: #000000;
    border: 1px solid #808080;
    border-radius: 5px;
    background-color: #fff;
    margin-top: 17px;
  }
  .review__main__area{
    width: 97%;
    margin: 0 auto;
  }
/* 口コミのアクティビティ情報欄 */
  .review__info__wrapper{
    display: flex;
  }
  .experience__picture{
    height: 60px;
    width: 80px;
    margin: 0 15px 5px 0;
  }
  .activity__name{
    display: inline-block;
    margin: 2px 0;
  }
  .activity__place{
    font-size: 11px;
    margin: 1px 0 0 1px;
  }
/* 口コミ投稿日情報欄 */
  .reviewed__at__wrapper{
    font-size: 14px;
    margin: 0 0 0 auto;
  }
/* 口コミタイトル表示欄 */
  .review__title{
    font-weight: bold;
  }
/* 口コミ本文表示欄 */
  .triangle{
    color: #eee;
    margin: -5px 0 0 27px;
    font-size: 14px;
  }
  .review__comment__area{
    margin-top: -7px;
    padding: 8px;
    border-radius: 6px;
    background-color: #eee;
  }
  .review__comment{
    font-size: 20px;
  }
/* 訪問記録がなかった場合の文字 */
  .not__contents{
    display: block;
    font-size: 18px;
    font-weight: bold;
    min-height: calc(100vh - 386);
    padding-bottom: 17px;
    margin-top: 17px;
  }
</style>
