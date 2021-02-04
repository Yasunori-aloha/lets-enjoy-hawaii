<template>
  <li v-if="experienceData.already_favorited" @click="favoriteRemove()" class="favorite">
    <i class="fas fa-star"></i>
    <span>{{ experienceData.favorite_counts }}</span>
  </li>
  <li v-else class="favorite" @click="favoriteRegistration()">
    <i class="far fa-star"></i>
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
          userId: this.userData.id,
          experienceId: this.experienceData.id,
        });
    },
    favoriteRemove: async function() {
      await this.$store.dispatch('favoriteRemove',
        {
          userId: this.userData.id,
          experienceId: this.experienceData.id,
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
    cursor: pointer;
  }
  .fa-star{
    color: #ffa500;
  }
</style>
