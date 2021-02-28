<template>
  <div :class="{search__wrapper: $mq !== 'sm', search__wrapper__sm: $mq === 'sm'}">
    <div v-if="$mq !== 'sm'">
      <div class="search__left">
        <div class="search__type__wrapper">
          <SearchHeader searchHeaderName='目的から探す' />
          <div class="search__type__main">
            <ul class="search__type__main__list">
              <HomeTypeButton v-for="(n, index) in 3" :categoryId="index"  />
            </ul>
            <ul class="search__type__main__list">
              <HomeTypeButton v-for="(n, index) in 3" :categoryId="index + 3" />
            </ul>
          </div>
        </div>
        <div class="searh__word__wrapper">
          <SearchHeader searchHeaderName='キーワードから探す' />
          <div class="search__word__main">
            <SearchForm />
          </div>
        </div>
      </div>
      <div class="search__right">
        <div class="search__map__wrapper">
          <SearchHeader searchHeaderName='地図から探す' />
          <HomeIslandMap />
        </div>
        <div class="search__name__wrapper">
          <SearchHeader searchHeaderName='島名から探す' />
          <div class="search__name__main">
            <ul class="search__name__main__list">
              <HomeIslandName v-for="(n, index) in 4" :areaId="index" />
            </ul>
            <ul class="search__name__main__list">
              <HomeIslandName v-for="(n, index) in 4" :areaId="index + 4" />
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import SearchHeader from '../components/SearchHeader.vue';
import HomeTypeButton from '../components/HomeTypeButton.vue';
import HomeIslandName from '../components/HomeIslandName.vue';
import HomeIslandMap from '../components/HomeIslandMap.vue';
import SearchForm from '../components/SearchForm.vue';

export default {
  components: {
    SearchHeader,
    HomeTypeButton,
    HomeIslandName,
    HomeIslandMap,
    SearchForm,
  },
  beforeRouteLeave (to, from, next) {
    this.$store.commit('mapReset');
    next();
  }
};
</script>

<style scoped>
  .search__wrapper{
    background-image: url('../../../public/images/toppage.jpg');
    background-repeat: no-repeat;
    background-position: center center;
    background-size: cover;
    height: calc(100vh - 185px);
  }
  .search__wrapper > div{
    align-items: center;
    display: flex;
    height: 100%;
    justify-content: center;
    width: 100%;
  }
  .search__left{
    height: 576px;
    width: 435px;
    margin-right: 25px;
  }
  /* 目的から探す欄 */
  .search__type__wrapper{
    height: 325px;
    background-color: rgba(255, 255, 255, 0.85);
    backdrop-filter: blur(5px);
  }
  .search__type__main{
    height: 281px;
    display: flex;
  }
  .search__type__main__list{
    width: 217.5px;
    padding: 11px 0;
  }
  /* キーワードから探す欄 */
  .searh__word__wrapper{
    height: 241px;
    background-color: rgba(255, 255, 255, 0.85);
    backdrop-filter: blur(5px);
    margin-top: 10px;
  }
  .search__word__main{
    height: 197px;
    width: 435px;
  }
  .search__right{
    height: 576px;
    width: 600px;
  }
  /* 地図から探す欄 */
  .search__map__wrapper{
    height: 443px;
    background-color: rgba(255, 255, 255, 0.85);
    backdrop-filter: blur(5px);
  }
  /* 島名から探す欄 */
  .search__name__wrapper{
    height: 123px;
    background-color: rgba(255, 255, 255, 0.85);
    backdrop-filter: blur(5px);
    margin-top: 10px;
  }
  .search__name__main{
    height: 123px;
    padding: 0 20px;
    margin-top: 7px;
  }
  .search__name__main__list{
    display: flex;
  }
  /* スマホ表示用 */
  .search__wrapper__sm{
    background-image: url('../../../public/images/toppage.jpg');
    background-repeat: no-repeat;
    background-position: center center;
    background-size: cover;
    min-height: calc(100vh - 94px);
  }
</style>
