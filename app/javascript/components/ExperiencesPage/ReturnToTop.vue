<template>
  <li class="return__to__top">
    <i class="fas fa-caret-up" style="margin-right: 3px;"></i>
    <span @click="returnToTop()" style="color: #0000FF;">このページのTOPへ</span>
  </li>
</template>

<script>
export default {
  methods: {
    returnToTop() {
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      })
    },
  },
};
</script>

<style scoped>
  .return__to__top{
    height: 38px;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    padding-right: 10px;
    font-size: 12px;
    font-weight: bold;
    display: flex;
    align-items: center;
    justify-content: flex-end;
  }
</style>
