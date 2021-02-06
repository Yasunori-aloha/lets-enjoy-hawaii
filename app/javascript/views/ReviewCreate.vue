<template>
  <div class="review__wrapper">
    <div class="review__form">
      <form>
        <div class="review__form__tile">
          <div class="review__form__title__wrapper">
            <div class="head__icon"></div>
            <h1 class="head__name">口コミを投稿する</h1>
          </div>
          <div class="review__experience__info">
            <ActivityPicture :activity="experienceData" />
            <ul class="experience__name__wrapper">
              <li class="experience__icon__name">
                <CategoryIcon :category-name="experienceData.genre.category.search" />
                <span class="experience__name">{{ experienceData.name }}</span>
              </li>
              <li class="experience__area">
                <span>エリア：{{ experienceData.area.island.name }} > {{ experienceData.area.name }}</span>
              </li>
              <li class="experience__address">
                <span>住所：{{ experienceData.address }}</span>
              </li>
            </ul>
          </div>
        </div>
        <div class="review__form__score">
          <div class="review__score__title">
            <h2 class="score__title">総合評価</h2>
            <span class="score__info">（星をクリックして評価してください）</span>
            <span class="required__item">必須</span>
          </div>
          <ul class="review__score">
            <li v-for="index in 5">
              <label :for="`review_score${index}`" class="review__score__star">☆</label>
              <input type="radio" :id="`review_score${index}`" name="review[score]" :value="`${index}`" class="review__btn">
            </li>
          </ul>
        </div>
        <div>
          <div class="review__content__title">
            <h2 class="score__title">口コミ</h2>
            <span class="required__item">必須</span>
          </div>
          <ul class="review__content__main">
            <li class="review__title__info">
              <div class="title__icon"></div>
              <label for="review_title" class="title__name">タイトル（50文字以内）</label>
            </li>
            <li class="review__title__main">
              <input type="text" id="review_title" name="review[title]" maxlength="50" placeholder="体験した感想や伝えたいことをまとめましょう" size="50" class="review__title">
            </li>
            <li class="review__main__info">
              <div class="main__icon"></div>
              <label for="review_comment" class="main__name">内容（1000文字以内）</label>
            </li>
            <li class="review__main">
              <textarea name="review[comment]" id="review_comment" maxlength="1000" placeholder="ご自身が実際に体験を通して感じた感想をお聞かせください。
これから訪れようとしている人へのアドバイスやおすすめ等を記入してください。" class="review"></textarea>
            </li>
          </ul>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import ActivityPicture from '../components/ActivityPicture.vue';
import CategoryIcon from '../components/CategoryIcon.vue';

export default {
  components: {
    ActivityPicture,
    CategoryIcon,
  },
  computed: {
    experienceData() {
      return this.$store.getters.experienceData;
    },
  },
  created() {
    console.log(this.experienceData);
  },
};
</script>

<style scoped>
/* 口コミ投稿ページ表示欄 */
  .review__wrapper{
    width: 950px;
    margin: 0 auto 100px;
    display: flex;
    justify-content: space-between;
  }
  .review__form{
    width: 750px;
    color: #333333;
  }
/* 口コミ投稿ページタイトル表示欄 */
  .review__form__tile{
    margin-top: 28px;
  }
  .review__form__title__wrapper{
    display: flex;
  }
  .head__icon{
    height: 22px;
    width: 5px;
    border-radius: 2px;
    background-color: #ff4500;
  }
  .head__name{
    font-size: 18px;
    font-weight: bold;
    margin-left: 8px;
  }
/* アクティビティ情報表示欄 */
  .review__experience__info{
    display: flex;
    margin-top: 27px;
  }
  .experience__picture{
    height: 107px;
    width: 160px;
  }
  .experience__name__wrapper{
    margin-left: 15px;
  }
  .experience__icon__name{
    display: flex;
  }
  .experience__name{
    font-weight: bold;
    margin: 5px 0 0 8px;
  }
  .experience__area{
    margin-top: 9px;
    font-size: 11px;
    word-spacing: 0;
  }
  .experience__address{
    margin-top: 5px;
    font-size: 12px;
    word-spacing: 0;
  }
/* 口コミの評価点選択欄 */
  .review__form__score{
    margin-top: 25px;
  }
  .review__score__title{
    display: flex;
    align-items: flex-end;
    color: #ff4500;
    border-bottom: 3px solid #ff4500;
  }
  .score__title{
    font-weight: bold;
    font-size: 18px;
  }
  .score__info{
    font-size: 12px;
    margin-bottom: 3px;
  }
  .required__item{
    margin: 0 0 4px 5px;
    font-size: 11px;
    padding: 0 3px;
    color: #ffffff;
    background-color: #ff4500;
  }
/* 評価点用星表示欄 */
  .review__score{
    display: flex;
    font-size: 30px;
    margin: 5px 0 0 1px;
  }
  .review__score > li{
    height: 45px;
    width: 42px;
    position: relative;
    color: #ffa500;
    display: block;
  }
  .review__score__star{
    cursor: pointer;
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
  }
  .review__btn{
    display: none;
  }
/* 口コミの内容入力欄 */
  .review__content__title{
    display: flex;
    align-items: flex-end;
    color: #ff4500;
    border-bottom: 3px solid #ff4500;
    margin-top: 40px;
  }
  .review__content__main{
    margin-top: 17px;
  }
  .review__title__info{
    display: flex;
  }
  .title__icon{
    height: 22px;
    width: 5px;
    border-radius: 2px;
    background-color: #ff4500;
    height: 15px;
    border-radius: 1px;
  }
  .title__name{
    font-size: 14px;
    font-weight: bold;
    padding-left: 6px;
    line-height: 16px;
  }
  .review__title__main{
    padding-top: 6px;
  }
  .review__title{
    height: 24px;
    width: 752px;
    font-size: 13px;
  }
  .review__main__info{
    display: flex;
    margin-top: 12px;
  }
  .main__icon{
    height: 22px;
    width: 5px;
    border-radius: 2px;
    background-color: #ff4500;
    height: 15px;
    border-radius: 1px;
  }
  .main__name{
    font-size: 14px;
    font-weight: bold;
    padding-left: 6px;
    line-height: 16px;
  }
  .review__main{
    padding-top: 8px;
  }
  .review{
    height: 24px;
    width: 752px;
    font-size: 13px;
    resize: none;
    height: 182px;
  }
  input:focus::placeholder {
    color: transparent;
  }
</style>
