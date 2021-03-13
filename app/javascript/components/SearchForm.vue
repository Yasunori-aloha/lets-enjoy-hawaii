<template>
  <form v-if="$mq !== 'sm'" class="form">
    <div class="keyword">
      <label for="q_name_cont" class="main__word">キーワード</label>
      <input v-model="searchData.word" placeholder="ホテル名・地名やイベント名など" class="text__field"  type="search" name="q[name_cont]" id="q_name_cont">
    </div>
    <div class="select">
      <label for="q_score_gteq" class="main__select">評価</label>
      <select @change="choiceScore" ref="choiceScore" name="q[score_gteq]" id="score" class="select__box">
        <option v-for="(value, index) in optionTexts" :value="index">{{ value }}</option>
      </select>
    </div>
    <button @click.prevent="searchWordScore()" class="submit btn__hover">検索</button>
  </form>
  <form v-else class="form__sm">
    <div class="keyword__sm">
      <label for="q_name_cont" class="main__word">キーワード</label>
      <input v-model="searchData.word" placeholder="ホテル名・地名やイベント名など" class="text__field"  type="search" name="q[name_cont]" id="q_name_cont">
    </div>
    <div class="select">
      <label for="q_score_gteq" class="main__select">評価</label>
      <select @change="choiceScore" ref="choiceScore" name="q[score_gteq]" id="score" class="select__box">
        <option v-for="(value, index) in optionTexts" :value="index">{{ value }}</option>
      </select>
    </div>
    <button @click.prevent="searchWordScore()" class="submit btn__hover">検索</button>
  </form>
</template>

<script>
export default {
  data() {
    return {
      optionTexts: [
        '------------',
        '★1.0以上',
        '★2.0以上',
        '★3.0以上',
        '★4.0以上',
      ],
    }
  },
  computed: {
    searchData() {
      return this.$store.getters.searchData;
    },
  },
  methods: {
    searchWordScore: async function() {
      await localStorage.setItem('searchWord', this.searchData.word);
      await localStorage.setItem('searchScore', this.searchData.score);
      this.$router.push('/search');
    },
    choiceScore(option) {
      this.searchData.score = option.target.value;
    },
  },
};
</script>

<style scoped>
  .form{
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .keyword{
    margin: 0 auto 10px 0;
    padding-left: 20px;
  }
  .main__word{
    margin-right: 10px;
    color: #646464;
    font-weight: bold;
  }
  .text__field{
    margin: 10px 0;
    padding-left: 5px;
    height: 32px;
    width: 300px;
    border: 1px solid #808080;
    border-radius: 4px;
  }
  .select{
    margin-right: auto;
    padding-left: 68px;
  }
  .main__select{
    margin-right: 10px;
    color: #646464;
    font-weight: bold;
  }
  .select__box{
    margin: 10px 0;
    height: 37px;
    border: 1px solid #808080;
    border-radius: 4px;
  }
  .submit{
    margin-top: 10px;
    height: 54px;
    width: 300px;
    cursor: pointer;
    color: #fff;
    border: none;
    border-radius: 4px;
    background-color: #90b200;
    font-size: 18px;
  }
  /* スマホ表示用 */
  .form__sm{
    padding-bottom: 16px;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .keyword__sm{}
</style>
