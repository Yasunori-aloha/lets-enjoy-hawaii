<template>
  <div class="user__page__menu">
    <div>
      <router-link :to="`/users/${userData.id}`" class="link__hover" >マイページトップ</router-link>
      <span> › {{ currentPage }}</span>
    </div>
  </div>
</template>

<script>
export default {
  props: ["currentPage"],
  computed: {
    userData() {
      return this.$store.getters.userData;
    },
  },
};
</script>

<style scoped>
.user__page__menu{
  text-align: left;
  font-size: 12px;
  border-bottom: 1px dotted black;
  width: 100%;
  padding: 10px 0 5px 0;
  margin: 0 auto;
}
</style>
