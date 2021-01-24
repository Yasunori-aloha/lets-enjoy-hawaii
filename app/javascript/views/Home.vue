<template>
  <div class='search__wrapper'>
    <div>
      <div class="search__left">
        <div class="search__type__wrapper">
          <SearchHeader searchHeaderName='目的から探す' />
          <div class="search__type__main">
            <ul class="search__type__main__list">
              <HomeTypeButton searchTypeImage="hotel_icon" searchTypeLink="/" searchTypeName="ホテル" searchTypeName2="コンドミニアム" />
              <HomeTypeButton searchTypeImage="lunch_icon" searchTypeLink="/" searchTypeName="食事" />
              <HomeTypeButton searchTypeImage="car_icon" searchTypeLink="/" searchTypeName="レンタカー" />
            </ul>
            <ul class="search__type__main__list">
              <HomeTypeButton searchTypeImage="leisure_icon" searchTypeLink="/" searchTypeName="遊び・体験" />
              <HomeTypeButton searchTypeImage="landmark_icon" searchTypeLink="/" searchTypeName="観光地" />
              <HomeTypeButton searchTypeImage="shopping_icon" searchTypeLink="/" searchTypeName="ショッピング" />
            </ul>
          </div>
        </div>
        <div class="searh__word__wrapper">
          <SearchHeader searchHeaderName='キーワードから探す' />
          <div class="search__word__main">
            <form action="/search" accept-charset='UTF-8' method='get' class="form">
              <div class="keyword">
                <label for="q_name_cont" class="main__word">キーワード</label>
                <input placeholder="ホテル名・地名やイベント名など" class="text__field"  type="search" name="q[name_cont]" id="q_name_cont">
              </div>
              <div class="select">
                <label for="q_score_gteq" class="main__select">評価</label>
                <select name="q[score_gteq]" id="score" class="select__box">
                  <option value="0">------------</option>
                  <option value="1">★1.0以上</option>
                  <option value="2">★2.0以上</option>
                  <option value="3">★3.0以上</option>
                  <option value="4">★4.0以上</option>
                </select>
              </div>
              <input type="submit" name="commit" value="検索" class="submit btn__hover">
            </form>
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
export default {
  components: {
    SearchHeader,
    HomeTypeButton,
    HomeIslandName,
    HomeIslandMap,
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
  .form{
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .keyword{
    margin: 0 auto 10px 0;
    padding-left: 20px;
  }
  .main__word{
    margin-right: 10px;
    color: #646464;
    font-weight: bold;
  }
  .text__field{
    margin: 10px 0;
    padding-left: 5px;
    height: 32px;
    width: 300px;
    border: 1px solid #808080;
    border-radius: 4px;
  }
  .select{
    margin-right: auto;
    padding-left: 68px;
  }
  .main__select{
    margin-right: 10px;
    color: #646464;
    font-weight: bold;
  }
  .select__box{
    margin: 10px 0;
    height: 37px;
    border: 1px solid #808080;
    border-radius: 4px;
  }
  .submit{
    margin-top: 10px;
    height: 54px;
    width: 300px;
    cursor: pointer;
    color: #fff;
    border: none;
    border-radius: 4px;
    background-color: #90b200;
    font-size: 18px;
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
</style>
