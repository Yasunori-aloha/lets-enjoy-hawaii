<template>
  <div>
    <router-view name="header" />
    <ExperiencesPageMenu />
    <div class="experience__page__wrapper">
      <div class="experience__page__left">
        <div class="experience__info__wrapper">
          <div class="experience__info__left">
            <ul>
              <li class="experience__name__wrapper">
                <img src="" class="category__icon">
                <h1 class="experinece__name">アクティビティ名称{{  }}</h1>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="experience__page__right"></div>
    </div>
    <router-view name="footer" />
  </div>
</template>

<script>
import ExperiencesPageMenu from '../components/ExperiencesPage/ExperiencesPageMenu.vue';
export default {
  components: {
    ExperiencesPageMenu,
  }
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
  .experience__info__left{
    width: 500px;
    margin: 25px 0;
    color: #333333;
  }
/* アクティビティ名称表示欄 */
  .experience__name__wrapper{
    display: flex;
  }
  .category__icon{
    height: 35px;
    width: 35px;
    /* background-image: url(''); */
    background-repeat: no-repeat;
    background-position: center center;
    background-size: cover;
  }
  .experinece__name{
    font-size: 24px;
    font-weight: bold;
    margin: -1px 0 0 3px;
  }
  .experience__page__right{
    width: calc(100% - 770px)
  }
</style>
