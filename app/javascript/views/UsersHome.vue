<template>
  <div class="my__page__image">
    <div class="my__page__wrapper">
      <div class="my__page__head">
        <ul class="my__page__head__list">
          <li class="my__page__head__number">お気に入りした場所 {{ 0 }}</li>
          <li class="my__page__head__number">口コミ数{{ 0 }}</li>
          <li class="my__page__head__number">行った場所{{ 0 }}</li>
        </ul>
      </div>
      <div class="my__page__main"></div>
    </div>
  </div>
</template>

<script>
export default {

};
</script>

<style scoped>
/* 背景 */
.my__page__image{
  background-attachment: fixed;
  background-image: url('/assets/mypage_image.jpg');
  background-position: center center;
  background-repeat: no-repeat;
  background-size: cover;
  height: 100%;
  min-height: calc(100vh - 185px);
  width: 100%;
}
.my__page__wrapper{
  background-color: rgba(0, 0, 0, 0.5);
  min-height: calc(100vh - 185px);
}
/* ユーザーページヘッダー */
.my__page__head{
  border-bottom: 1px solid #646464;
  display: flex;
  height: 94px;
  justify-content: center;
}
.my__page__head__list{
  color: white;
  font-size: 16px;
  height: 100%;
  padding-top: 12px;
  text-align: end;
  width: 950px;
}
.my__page__head__number{
  margin-bottom: 2px;
}
</style>
