<template>
  <div class="my__page__main__right">
    <div class="user__reviews__wrapper">
      <UsersPageMenu currentPage="今までの口コミ" />
      <div class="user__reviews__show__area">
        <ul v-if="reviewsIsExists" class="user__reviews__list"></ul>
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
    min-height: calc(100vh - 369px);
    padding-top: 17px;
  }
/* 訪問記録一覧 */
  .user__reviews__list{
    display: flex;
    width: 742px;
    flex-wrap: wrap;
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
