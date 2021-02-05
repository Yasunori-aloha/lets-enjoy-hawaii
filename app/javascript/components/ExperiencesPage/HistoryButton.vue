<template>
  <li v-if="alreadyHistoried" @click="historyRemove()" class="history__place">
    <i class="fas fa-check"></i>
    <span class="history">行った</span>
  </li>
  <li v-else @click="historyRegistration()" class="history__place">
    <i class="fas fa-shoe-prints fa-rotate-270"></i>
    <span class="history">行った</span>
  </li>
</template>

<script>
export default {
  computed: {
    userId() {
      return this.$store.getters.userData.id;
    },
    experienceId() {
      return this.$store.getters.experienceData.id;
    },
    alreadyHistoried() {
      return this.$store.getters.experienceData.already_historied;
    },
  },
  methods: {
    historyRegistration: async function() {
      await this.$store.dispatch('historyRegistration',
        {
          userId: this.userId,
          experienceId: this.experienceId,
        });
    },
    historyRemove: async function() {
      await this.$store.dispatch('historyRemove',
        {
          userId: this.userId,
          experienceId: this.experienceId,
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
