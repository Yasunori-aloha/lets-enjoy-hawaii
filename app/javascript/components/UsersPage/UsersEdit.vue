<template>
  <div class="my__page__main__right">
    <div class="user__edit__wrapper">
      <UsersPageMenu currentPage="会員情報の確認・変更" />
      <p class="guest__user__alert"></p>
      <form action="" class="edit__user"></form>
    </div>
  </div>
</template>

<script>
import UsersPageMenu from '../UsersPage/UsersPageMenu.vue';

export default {
  components: {
    UsersPageMenu,
  },
};
</script>

<style scoped>
  .user__edit__wrapper{
    height: 100%;
    width: 100%;
    border-radius: 5px;
    margin: 28px 0;
    padding: 0 17px;
    background-color: rgba(255, 255, 255, 0.75);
    color: black;
    display: block;
  }
/* ゲストユーザーアラート */
  .guest__user__alert{
    color: red;
    margin: 0;
    padding-top: 17px;
    text-align: center;
  }
/* ユーザー情報更新欄 */
  .edit__user{
    padding-top: 17px;
    text-align: end;
  }
</style>
