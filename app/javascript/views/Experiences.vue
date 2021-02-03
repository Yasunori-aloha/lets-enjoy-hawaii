<template>
  <div>
    <router-view name="header" />
    <ExperiencesPageMenu />
    <div class="experience__page__wrapper">
      <div class="experience__page__left">
        <div class="experience__info__wrapper">
          <div class="experience__info__left">
            <ul>
              <li class="experience__name__wrapper">
                <img src="" class="category__icon">
                <h1 class="experinece__name">アクティビティ名称{{  }}</h1>
              </li>
              <li class="experience__score">
                <div class="star__rating__wrapper">
                  <div class="star__rating__front">★★★★★</div>
                  <div class="star__rating__back">★★★★★</div>
                </div>
                <span class="rating__point">点数{{  }}</span>
                <span class="review__counts">（</span>
                <a href="" class="review__link review__counts link__hover">口コミ{{  }}件</a>
                <span class="review__counts">）</span>
              </li>
              <li class="area__island__wrapeer">
                <span class="area__name">エリア</span>
                <a href="/" class="island search_btn link__hover area__island">エリア名{{  }}</a>
                <a href="/" class="area search_btn link__hover area__island">島名{{  }}</a>
              </li>
              <li class="genre__category__wrapper">
                <span class="genre__name">ジャンル</span>
                <a href="" class="category search_btn link__hover genre__category">カテゴリー名{{  }}</a>
                <a href="" class="genre search_btn link__hover genre__category">ジャンル名{{  }}</a>
              </li>
            </ul>
          </div>
          <div class="experience__info__right">
            <ul>
              <li class="reviews__share">
                <i class="far fa-comment-dots fa-flip-horizontal"></i>
                <span>口コミ投稿</span>
                <a href="" class="btn"></a>
              </li>
              <li class="reviews__share">
                <i class="fas fa-share"></i>
                <span>シェアする</span>
                <a href="" class="btn"></a>
              </li>
            </ul>
            <ul class="favorite__history__wrapper"></ul>
          </div>
        </div>
      </div>
      <div class="experience__page__right"></div>
    </div>
    <router-view name="footer" />
  </div>
</template>

<script>
import ExperiencesPageMenu from '../components/ExperiencesPage/ExperiencesPageMenu.vue';
export default {
  components: {
    ExperiencesPageMenu,
  }
};
</script>

<style scoped>
/* アクティビティ詳細表示欄 */
  .experience__page__wrapper{
  font-size: 10px;
  margin: 0 auto;
  width: 950px;
  display: flex;
  margin-bottom: 30px;
  }
  .experience__page__left{
    width: 740px;
    margin-right: 30px;
  }
/* アクティビティ情報表示欄 */
  .experience__info__wrapper{
    display: flex;
    justify-content: space-between;
  }
  .experience__info__left{
    width: 500px;
    margin: 25px 0;
    color: #333333;
  }
/* アクティビティ名称表示欄 */
  .experience__name__wrapper{
    display: flex;
  }
  .category__icon{
    height: 35px;
    width: 35px;
    /* background-image: url(''); */
    background-repeat: no-repeat;
    background-position: center center;
    background-size: cover;
  }
  .experinece__name{
    font-size: 24px;
    font-weight: bold;
    margin: -1px 0 0 3px;
  }
/* アクティビティのレーティング表示欄 */
  .experience__score{
    padding-top: 5px;
    display: flex;
  }
  .star__rating__wrapper{
    margin-right: 6px;
    width: 5em;
    line-height: 22px;
    font-size: 22px;
    position: relative;
  }
  .star__rating__front{
    position: absolute;
    top: 0;
    left: 0;
    overflow: hidden;
    color: #ffa500;
    width: var(--width);
  }
  .star__rating__back{
    color: #808080;
  }
/* アクティビティの点数表示欄 */
  .rating__point{
    font-size: 16px;
    line-height: 26px;
    font-weight: bold;
    color: black;
  }
/* 口コミ件数表示欄 */
  .review__counts{
    color: black;
    font-weight: unset;
    font-size: 12px;
    line-height: 25px;
  }
  .review__link{
    color: blue;
  }
/* アクティビティのエリア表示欄 */
  .area__island__wrapeer{
    display: flex;
    font-size: 12px;
    margin-top: 12px;
  }
  .area__name{
    font-weight: bold;
    margin-right: 40px;
  }
  .area__island{
    margin: -1px 6px 0 8px;
  }
/* アクティビティのジャンル表示欄 */
  .genre__category__wrapper{
    display: flex;
    font-size: 12px;
    margin-top: 5px;
  }
  .genre__name{
    font-weight: bold;
    margin-right: 29px;
  }
  .genre__category{
    margin: -1px 6px 0 8px;
  }
/* 口コミやお気に入りボタン表示欄 */
  .experience__info__right{
    height: 140px;
    width: 170px;
    margin: 25px 0;
    color: #333333;
  }
  .reviews__share{
    height: 37px;
    line-height: 37px;
    font-size: 20px;
    border: 1px solid #ccc;
    border-radius: 3px;
    text-align: center;
    margin-bottom: 5px;
    position: relative;
    background: linear-gradient(#ffffff, #e4e4e4);
  }
  .btn{
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
  }
/* お気に入り・訪問記録登録表示欄 */
  .favorite__history__wrapper{
    display: flex;
  }
  .experience__page__right{
    width: calc(100% - 770px)
  }
</style>
