<template>
  <div class="my__page__main__right">
    <div class="user__histories__wrapper">
      <UsersPageMenu currentPage="行った場所" />
      <div class="user__histories__show__area">
        <ul v-if="historyIsExists" class="user__histories__list"></ul>
        <span v-else class="not__contents">まだ訪問したアクティビティはありません。</span>
      </div>
    </div>
  </div>
</template>

<script>
import UsersPageMenu from '../UsersPage/UsersPageMenu.vue';

export default {
  components: {
    UsersPageMenu,
  },
  computed: {
    historyIsExists() {
      return false;
    },
  },
};
</script>

<style scoped>
  .user__histories__wrapper{
    height: 100%;
    width: 776px;
    margin: 28px 0;
    padding: 0 17px;
    border-radius: 5px;
    color: black;
    display: block;
    background-color: rgba(255, 255, 255, 0.75);
  }
  .user__histories__show__area{
    min-height: calc(100vh - 369px);
    padding-top: 17px;
  }
  .user__histories__list{
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
