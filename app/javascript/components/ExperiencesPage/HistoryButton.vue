<template>
  <li v-if="userData.alreadyHistoried" @click="historyRemove()" class="history__place">
    <i class="fas fa-check"></i>
    <span class="history">行った</span>
  </li>
  <li v-else @click="historyRegistration()" class="history__place">
    <i class="fas fa-shoe-prints fa-rotate-270"></i>
    <span class="history">行った</span>
  </li>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  computed: {
    ...mapGetters(["experienceData","userData", "userTokens"]),
  },
  methods: {
    historyRegistration: async function() {
      if (this.userTokens['access-token'] === null) {
        return this.$router.push('/users/sign_up');
      };
      await this.$store.dispatch('historyRegistration',
        {
          userId: this.userData.id,
          experienceId: this.experienceData.id,
        });
    },
    historyRemove: async function() {
      await this.$store.dispatch('historyRemove',
        {
          userId: this.userData.id,
          experienceId: this.experienceData.id,
        });
    },
  },
};
</script>

<style scoped>
/* 訪問記録登録ボタン */
  .history__place{
    height: 25px;
    width: calc((170px - 5px) / 2) ;
    line-height: 25px;
    font-size: 15px;
    border: 1px solid #ccc;
    border-radius: 3px;
    padding-left: 5px;
    position: relative;
    background: linear-gradient(#ffffff, #e4e4e4);
    margin-left: 5px;
    cursor: pointer;
  }
  .history{
    float: right;
    margin-right: 6px;
  }
</style>
