<template>
  <div class="my__page__main__right">
    <div class="user__reviews__wrapper">
      <UsersPageMenu currentPage="今までの口コミ" />
      <div class="user__reviews__show__area"></div>
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
</style>
