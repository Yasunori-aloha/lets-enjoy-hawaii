<template>
  <div class='search__wrapper'>
    <div>
      <div class="search__left">
        <div class="search__type__wrapper">
          <SearchHeader name='目的から探す' />
          <div class="search__type__main"></div>
        </div>
        <div class="searh__word__wrapper">
          <SearchHeader name='キーワードから探す' />
        </div>
      </div>
      <div class="search__right">
        <div class="search__map__wrapper">
          <SearchHeader name='地図から探す' />
        </div>
        <div class="search__name__wrapper">
          <SearchHeader name='島名から探す' />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import SearchHeader from '../components/SearchHeader.vue';
export default {
  components: {
    SearchHeader
  }
};
</script>

<style scoped>
  .search__wrapper{
    background: url('/assets/toppage.jpg');
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
  .search__type__wrapper{
    height: 325px;
    background-color: rgba(255, 255, 255, 0.85);
    backdrop-filter: blur(5px);
  }
  .searh__word__wrapper{
    height: 241px;
    background-color: rgba(255, 255, 255, 0.85);
    backdrop-filter: blur(5px);
    margin-top: 10px;
  }
  .search__right{
    height: 576px;
    width: 600px;
  }
  .search__map__wrapper{
    height: 443px;
    background-color: rgba(255, 255, 255, 0.85);
    backdrop-filter: blur(5px);
  }
  .search__name__wrapper{
    height: 123px;
    background-color: rgba(255, 255, 255, 0.85);
    backdrop-filter: blur(5px);
    margin-top: 10px;
  }
</style>
