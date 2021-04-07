<template>
  <li v-if="experienceData.already_historied" @click="historyRemove()" :class="{history__place: $mq !== 'sm', history__place__sm: $mq === 'sm'}">
    <i class="fas fa-check"></i>
    <span class="history">行った</span>
  </li>
  <li v-else @click="historyRegistration()" :class="{history__place: $mq !== 'sm', history__place__sm: $mq === 'sm'}">
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
  .history__place, .history__place__sm{
    line-height: 26px;
    border: 1px solid #ccc;
    border-radius: 3px;
    padding-left: 5px;
    position: relative;
    background: linear-gradient(#ffffff, #e4e4e4);
  }
  .history__place{
    height: 25px;
    width: calc((170px - 5px) / 2) ;
    font-size: 15px;
    margin-left: 5px;
    cursor: pointer;
  }
  .history{
    float: right;
    margin-right: 6px;
  }
/* スマホ表示用 */
  .history__place__sm{
    height: calc(100% / 3);
    width: calc(100vw / 4.5) ;
    margin-top: calc(100% / 9);
  }
</style>
