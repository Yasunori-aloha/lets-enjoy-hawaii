<template>
  <div class="my__page__main__right">
    <div class="user__reviews__wrapper">
      <UsersPageMenu currentPage="今までの口コミ" />
      <div class="user__reviews__show__area">
        <ul v-if="reviewsIsExists">
          <li class="reviews__wrapper">
            <div class="review__main__area">
              <ul class="review__info__wrapper">
                <li>
                  <a href="">
                    <img src="" class="activity__picture">
                  </a>
                </li>
                <li>
                  <a href="" class="activity__name link__hover">{{  }}</a>
                    <p class="activity__place">{{  }} > {{  }}</p>
                </li>
                <li class="reviewed__at__wrapper">
                    <p></p>
                </li>
              </ul>
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
import { mapGetters } from "vuex";

export default {
  components: {
    UsersPageMenu,
  },
  computed: {
    ...mapGetters(["userReviews"]),
    reviewsIsExists() {
      return this.userReviews !== null;
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
  .activity__picture{
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

  }
/* 訪問記録がなかった場合の文字 */
  .not__contents{
    display: block;
    font-size: 18px;
    font-weight: bold;
    min-height: calc(100vh - 386);
    padding-bottom: 17px;
  }
</style>
