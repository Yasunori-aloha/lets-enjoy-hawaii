<template>
  <ul v-if="$mq !== 'sm'" class="review__picture">
    <li class="review__picture__title">
      <h2 class="picture__title">写真</h2>
    </li>
    <li class="picture__btn">
      <i class="fas fa-camera"></i>
      <label for="review_images" class="picture__add">写真を追加する</label>
      <input @change="previewImages()" ref="reviewImages" type="file" id="review_images" name="review[images][]" multiple="multiple" accept="image/*" class="hidden">
    </li>
    <li>
      <p class="picture__info">写真を複数選択して、一度に追加することができます。</p>
    </li>
    <li class="picture__main__wrapper">
      <ul class="picture__preview__area" :style="previewAreaHeight(imagesUrl.length)">
        <li v-for="(image, index) in imagesUrl" :key="image" class="preview__wrapper">
          <img :src="image" class="preview">
          <div @click="previewDelete(index)" @mouseover="buttonOver(index)" @mouseleave="buttonLeave(index)" class="picture__delete">
            <i class="far fa-window-close"></i>
            <span ref="deleteButton" class="delete__btn">写真削除</span>
          </div>
        </li>
      </ul>
    </li>
  </ul>
  <ul v-else>
    <li class="review__picture__title__sm">
      <span class="required__item__sm">任意</span>
      <h2 class="picture__title__sm">写真</h2>
    </li>
    <li v-if="imagesUrl.length !== 0">
      <ul>
        <li class="preview__wrapper__sm">
          <img class="preview__sm" src="" alt="">
          <span class="preview__name__sm"></span>
          <div class="delete__btn__sm">×</div>
        </li>
      </ul>
    </li>
    <li class="picture__btn__wrapper__sm">
      <div class="picture__btn__sm">
        <i class="fas fa-camera camera__sm"></i>
        <span class="picture__add__sm">写真を登録する</span>
        <label for="review_images"/>
        <input @change="previewImages()" ref="reviewImages" type="file" id="review_images" name="review[images][]" multiple="multiple" accept="image/*" class="hidden">
      </div>
    </li>
  </ul>
</template>

<script>
export default {
  data() {
    return {
      imagesUrl: [],
    }
  },
  computed: {
    reviewData() {
      return this.$store.getters.reviewData;
    },
  },
  methods: {
    previewImages() {
      const images = this.$refs.reviewImages.files;

      // 入力された画像を'reviewData'に保存し、プレビュー用のURLを'imagesUrl'に保存する。
      for (const image of images) {
        console.log(this.imagesUrl.length);
        this.reviewData.images.push(image);
        this.imagesUrl.push(URL.createObjectURL(image));
        console.log(this.imagesUrl.length);
        console.log(this.reviewData.images[0].name);
      }

      return this.$refs.reviewImages.value = null;
    },
    previewAreaHeight(imagesCounts) {
      if (imagesCounts >= 4) {
        return {
          '--height': '100%',
        }
      } else {
        return {
          '--height': '215px',
        }
      }
    },
    buttonOver(index) {
      return this.$refs.deleteButton[index].style.color = '#ffa500';
    },
    buttonLeave(index) {
      return this.$refs.deleteButton[index].style.color = '#0000ff';
    },
    previewDelete(index) {
      this.reviewData.images.splice(index, 1);
      return this.imagesUrl.splice(index, 1);
    },
  },
};
</script>

<style scoped>
/* 口コミ写真タイトル表示欄 */
  .review__picture{
    margin-top: 30px;
  }
  .review__picture__title{
    display: flex;
    align-items: flex-end;
    color: #ff4500;
    border-bottom: 3px solid #ff4500;
  }
  .picture__title{
    font-weight: bold;
    font-size: 18px;
  }
/* 口コミ写真追加ボタン表示欄 */
  .picture__btn{
    height: 30px;
    width: 188px;
    margin-top: 15px;
    padding-left: 8px;
    font-size: 19px;
    border: 1px solid #ccc;
    border-radius: 3px;
    background: linear-gradient(#ffffff, #e4e4e4);
    color: #787878;
    display: flex;
    align-items: center;
    position: relative;
  }
  .picture__add{
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    line-height: 28px;
    font-size: 14px;
    font-weight: bold;
    text-align: center;
    color: #333333;
    cursor: pointer;
  }
  .picture__info{
    font-size: 12px;
    text-align: right;
    margin-block-start: 1px;
    margin-block-end: 0;
  }
/* 添付画像プレビューエリア欄 */
  .picture__main__wrapper{
    margin-top: 10px;
    border-radius: 4px;
    background-color: #eee;
    display: flex;
  }
  .picture__preview__area{
    height: var(--height);
    width: 710px;
    margin: 20px auto;
    border: 3px dotted #ccc;
    display: flex;
    flex-wrap: wrap;
    background-color: #ffffff;
  }
/* 画像プレビュー欄 */
  .preview__wrapper{
    margin: 20px 0 10px 20px;
  }
  .preview{
    height: 156px;
    width: 209px;
  }
  .picture__delete{
    margin-top: 5px;
    font-size: 12px;
    width: 67px;
    cursor: pointer;
  }
  .delete__btn{
    color: #0000ff;
    text-decoration: underline;
  }
/* スマホ表示用 */
  .review__picture__title__sm{
    height: 26px;
    line-height: 26px;
    margin-top: 5px;
    padding-left: 10px;
    font-size: 14px;
    display: flex;
    color: white;
    background-color: #FF4500;
  }
  .required__item__sm{
    height: 18px;
    width: 28px;
    line-height: calc(26px - (4px * 2));
    margin: 4px 0;
    font-size: 11px;
    text-align: center;
    color: #FF4500;
    background-color: white;
    display: block;
  }
  .picture__title__sm{
    margin-left: 10px;
  }
  .picture__btn__wrapper__sm{
    height: 78px;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .picture__btn__sm{
    height: 46px;
    width: calc(100% - 74px);
    padding-left: 8px;
    font-size: 25px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background: linear-gradient(#ffffff, #e4e4e4);
    color: #787878;
    display: flex;
    align-items: center;
    position: relative;
  }
  .picture__btn__sm > label{
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
  }
  .camera__sm{
    position: absolute;
    top: 50%;
    left: 50%;
    margin: -13px 0 0 -68px;
  }
  .picture__add__sm{
    width: 100%;
    font-size: 14px;
    font-weight: bold;
    color: #333333;
    position: absolute;
    top: 50%;
    left: 50%;
    margin: -10px 0 0 -29px;
  }
/* スマホ表示用 */
  .preview__wrapper__sm{
    padding: 10px 10px;
    border-top: 1px solid #ccc;
    display: flex;
    justify-content: space-between;
  }
  .preview__sm{
    height: 90px;
    width: 120px;
  }
  .preview__name__sm{
    width: calc(100vw - 170px);
    margin-left: 10px;
    font-size: 11px;
  }
  .delete__btn__sm{
    height: 20px;
    width: 20px;
    line-height: 17px;
    font-size: 18px;
    border-radius: 10px;
    font-weight: bold;
    text-align: center;
    color: white;
    background-color: gray;
  }
</style>
