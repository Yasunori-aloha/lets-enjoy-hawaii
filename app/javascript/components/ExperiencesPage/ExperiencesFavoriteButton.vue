<template>
  <li v-if="experienceData.already_favorited" @click="favoriteRegistration()" class="favorite">
    <i class="fas fa-star"></i>
    <a href="" class="btn"></a>
    <span>{{ experienceData.favorite_counts }}</span>
  </li>
  <li v-else class="favorite" @click="favoriteRemove()">
    <i class="far fa-star"></i>
    <a href="" class="btn"></a>
    <span>{{ experienceData.favorite_counts }}</span>
  </li>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  computed: {
    ...mapGetters(["experienceData","userData"]),
  },
  methods: {
    favoriteRegistration: async function() {
      await this.$store.dispatch('favoriteRegistration',
        {
          userId: this.userId,
          experienceId: this.experienceId,
        });
    },
    favoriteRemove: async function() {
      await this.$store.dispatch('favoriteRemove',
        {
          userId: this.userId,
          experienceId: this.experienceId,
        });
    },
  },
};
</script>

<style scoped>
/* お気に入り登録ボタン */
  .favorite{
    height: 25px;
    width: calc((170px - 5px) / 2) ;
    line-height: 25px;
    font-size: 15px;
    border: 1px solid #ccc;
    border-radius: 3px;
    padding-left: 5px;
    position: relative;
    background: linear-gradient(#ffffff, #e4e4e4);
  }
  .fa-star{
    color: #ffa500;
  }
</style>
