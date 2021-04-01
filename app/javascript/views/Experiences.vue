<template>
  <div v-if="$mq !== 'sm'" class="experience__page__wrapper">
    <div class="experience__page__left">
      <div class="experience__info__wrapper">
        <Info />
        <MultiButton />
      </div>
      <Tab />
      <Main v-if="isMain" />
      <router-view v-else />
    </div>
    <div class="experience__page__right"></div>
  </div>
  <div v-else>
    <div class="experience__info__wrapper">
      <Info />
      <!-- <MultiButton /> -->
    </div>
    <Tab />
    <Main v-if="isMain" />
    <!-- <router-view v-else /> -->
    <AreaGenre />
    <ReturnToTop />
  </div>
</template>

<script>
import AreaGenre from '../components/ExperiencesPage/AreaGenre.vue'
import Info from '../components/ExperiencesPage/Info.vue';
import MultiButton from '../components/ExperiencesPage/MultiButton.vue';
import Tab from '../components/ExperiencesPage/Tab.vue';
import Main from '../components/ExperiencesPage/Main.vue';
import ReturnToTop from '../components/ExperiencesPage/ReturnToTop.vue'

export default {
  components: {
    AreaGenre,
    Info,
    MultiButton,
    Tab,
    Main,
    ReturnToTop,
  },
  computed: {
    isMain() {
      return /^\/experiences\/\d{1,}$/.test(this.$route.path)
    },
  },
  beforeRouteLeave (to, from, next) {
    const toSearchPage = /^\/[\w\-]{1,}$/.test(to.path);

    if (!toSearchPage) {
      this.$store.commit('resetSearchWordScore');
    }

    next();
  },
};
</script>

<style scoped>
/* アクティビティ詳細表示欄 */
  .experience__page__wrapper{
  font-size: 10px;
  margin: 0 auto;
  width: 950px;
  display: flex;
  margin-bottom: 30px;
  }
  .experience__page__left{
    width: 740px;
    margin-right: 30px;
  }
/* アクティビティ情報表示欄 */
  .experience__info__wrapper{
    display: flex;
    justify-content: space-between;
  }
  .experience__page__right{
    width: calc(100% - 770px)
  }
</style>

<style>
  .main__wrapper__sm{
    margin-bottom: 20px;
    list-style: none;
  }
</style>
