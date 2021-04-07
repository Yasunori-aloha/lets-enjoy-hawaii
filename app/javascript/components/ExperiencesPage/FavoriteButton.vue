<template>
  <li v-if="experienceData.already_favorited" @click="favoriteRemove()" :class="{favorite: $mq !== 'sm', favorite__sm: $mq === 'sm'}">
    <i class="fas fa-star"></i>
    <span>{{ experienceData.favorite_counts }}</span>
  </li>
  <li v-else :class="{favorite: $mq !== 'sm', favorite__sm: $mq === 'sm'}" @click="favoriteRegistration()">
    <i class="far fa-star"></i>
    <span>{{ experienceData.favorite_counts }}</span>
  </li>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  computed: {
    ...mapGetters(["experienceData","userData", "userTokens"]),
  },
  methods: {
    favoriteRegistration: async function() {
      if (this.userTokens['access-token'] === null) {
        return this.$router.push('/users/sign_up');
      };

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
  .favorite, .favorite__sm{
    line-height: 26px;
    border: 1px solid #ccc;
    border-radius: 3px;
    padding-left: 5px;
    background: linear-gradient(#ffffff, #e4e4e4);
  }
  .favorite{
    height: 25px;
    width: calc((170px - 5px) / 2) ;
    font-size: 15px;
    cursor: pointer;
  }
  .fa-star{
    color: #ffa500;
  }
  .favorite__sm{
    height: calc(100% / 3);
    width: calc(100vw / 4.5);
    margin-top: calc(100% / 9);
  }
</style>
