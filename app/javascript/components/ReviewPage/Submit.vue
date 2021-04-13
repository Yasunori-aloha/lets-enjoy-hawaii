<template>
  <div v-if="$mq !== 'sm'" class="review__submit">
    <button @click.prevent="createReview()" class="submit btn__hover">投稿する</button>
  </div>
  <div v-else class="review__submit__sm" :style="submitHeight()">
    <button @click.prevent="createReview()" class="submit__sm btn__hover">投稿する</button>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  computed: {
    ...mapGetters(["userData", "experienceData", "reviewData"]),
  },
  methods: {
    createReview: async function() {
      let formData = new FormData();

      formData.append('review[score]', this.reviewData.score);
      formData.append('review[title]', this.reviewData.title);
      formData.append('review[comment]', this.reviewData.comment);
      this.reviewData.images.forEach(image => {
        formData.append('review[images][]', image);
      });

      await this.$store.dispatch('createReview',
      {
        userId: this.userData.id,
        experienceId: this.experienceData.id,
        formData,
      })
      .then(response => {
        this.$store.commit('resetReviewData');
        this.$router.replace(`/experiences/${this.experienceData.id}`);
      });
    },
    submitHeight() {
      let imageCounts = this.reviewData.images.length;

      if (imageCounts === 0) {
        return {"--min-height": 'calc(100vh - 665px)'};
      }

      return {"--min-height": '0px'};
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
/* スマホ表示用 */
  .review__submit__sm{
    min-height: var(--min-height);
  }
  .submit__sm{
    height: 57px;
    width: calc(100% - 20px);
    margin: 30px 10px;
    font-size: 16px;
    border-radius: 3px;
    font-weight: bold;
    color: #ffffff;
    border: none;
    background-color: #00b900;
    outline: none;
  }
</style>
