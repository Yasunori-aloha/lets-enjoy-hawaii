<template>
  <div class="review__submit">
    <button @click.prevent="createReview()" class="submit btn__hover">投稿する</button>
  </div>
</template>

<script>
export default {
  computed: {
    reviewData() {
      return this.$store.getters.reviewData;
    },
  },
  methods: {
    createReview: async function() {
      let formData = new FormData();

      formData.append('score', this.reviewData.score);
      formData.append('title', this.reviewData.title);
      formData.append('comment', this.reviewData.comment);
      formData.append('images', this.reviewData.images);

      await this.$store.dispatch('createReview', formData);
    },
  },
};
</script>

<style scoped>
/* 口コミ投稿ボタン表示欄 */
  .review__submit{
    margin-top: 31px;
    height: 100px;
    border-top: 1px solid #ccc;
    display: flex;
    justify-content: center;
  }
  .submit{
    height: 57px;
    width: 282px;
    margin: 50px 10px 0;
    font-size: 24px;
    border-radius: 3px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    color: #ffffff;
    border: none;
    background-color: #00b900;
    outline: none;
    cursor: pointer;
  }
</style>
