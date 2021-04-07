<template>
  <div v-if="$mq !== 'sm'" style="font-size: 12px;">
    <ul class="experience__info__wrapper">
      <li class="experience__info__left">
        <span>営業時間</span>
      </li>
      <li class="experience__info__right">
        <span v-if="isExists">{{ experienceData.business_hours_start }} 〜 {{ experienceData.business_hours_finish }}</span>
      </li>
    </ul>
    <ul class="experience__info__wrapper">
      <li class="experience__info__left">
        <span>所在地</span>
      </li>
      <li class="experience__info__right">
        <span class="location__postal__code">{{ experienceData.address }}</span>
      </li>
    </ul>
  </div>
  <div v-else style="font-size: 12px;">
    <ul class="experience__info__sm">
      <li class="experience__info__left__sm">
        <span>所在地</span>
      </li>
      <li class="experience__info__right__sm">
        <span>{{ experienceData.address }}</span>
      </li>
    </ul>
    <ul class="experience__info__sm">
      <li class="experience__info__left__sm">
        <span>営業時間</span>
      </li>
      <li class="experience__info__right__sm">
        <span v-if="isExists">{{ experienceData.business_hours_start }} 〜 {{ experienceData.business_hours_finish }}</span>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  computed: {
    experienceData() {
      return this.$store.getters.experienceData;
    },
    isExists() {
      return this.experienceData.business_hours_start !== null ? true : false;
    },
  },
};
</script>

<style scoped>
/* アクティビティ基本情報欄 */
  .experience__info__wrapper{
    height: 36px;
    border: 1px solid #ccc;
    color: #333333;
    display: flex;
  }
  .experience__info__wrapper:not(:first-child){
    margin-top: 0px;
    border-top: 0px;
  }
  .experience__info__left{
    height: 100%;
    width: 175px;
    padding: 8px 0 0 8px;
    border-right: 1px solid #ccc;
    font-weight: bold;
    background-color: #eaeaea;
  }
  .experience__info__right{
    padding: 8px 0 0 8px;
    display: flex;
  }
/* アクティビティの所在地表示欄 */
  .location__postal__code{
    margin-right: 16px;
  }
  .location__address{
    margin-right: 4px;
  }
/* スマホ表示用 */
  .experience__info__sm{
    margin: 11px 10px 0;
    border: 1px solid #ccc;
    color: #333333;
    display: flex;
  }
  .experience__info__sm:not(:first-child){
    margin-top: 0px;
    border-top: 0px;
  }
  .experience__info__left__sm{
    width: calc((100vw - 20px) * 0.4);
    padding: 8px 0 0 8px;
    border-right: 1px solid #ccc;
    font-weight: bold;
    background-color: #eaeaea;
  }
  .experience__info__right__sm{
    width: calc((100vw - 20px) * 0.6);
    padding: 8px 0 8px 8px;
    display: flex;
  }
</style>
