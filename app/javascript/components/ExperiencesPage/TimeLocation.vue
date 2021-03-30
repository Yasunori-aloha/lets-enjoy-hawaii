<template>
  <div v-if="$mq !== 'sm'">
    <ul class="experience__business__hours">
      <li class="business__hours__info">
        <span>営業時間</span>
      </li>
      <li class="business__hours__main">
        <span v-if="isExists">{{ experienceData.business_hours_start }} 〜 {{ experienceData.business_hours_finish }}</span>
      </li>
    </ul>
    <ul class="experience__location">
      <div class="location__info">
        <span>所在地</span>
      </div>
      <div class="locaiton__main">
        <span class="location__postal__code">{{ experienceData.address }}</span>
        <!-- <span class="location__address">{{  }}</span> -->
      </div>
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
/* アクティビティの営業時間表示欄 */
  .experience__business__hours{
    height: 36px;
    border: 1px solid #ccc;
    color: #333333;
    display: flex;
  }
  .business__hours__info{
    height: 100%;
    width: 175px;
    padding: 8px 0 0 8px;
    font-size: 12px;
    border-right: 1px solid #ccc;
    font-weight: bold;
    background-color: #eaeaea;
  }
  .business__hours__main{
    padding: 8px 0 0 8px;
    font-size: 12px;
    display: flex;
  }
/* アクティビティの所在地表示欄 */
  .experience__location{
    height: 36px;
    border: 1px solid #ccc;
    border-top: 0;
    color: #333333;
    display: flex;
  }
  .location__info{
    height: 100%;
    width: 175px;
    padding: 8px 0 0 8px;
    font-size: 12px;
    border-right: 1px solid #ccc;
    font-weight: bold;
    background-color: #eaeaea;
  }
  .locaiton__main{
    padding: 8px 0 0 8px;
    font-size: 12px;
    display: flex;
  }
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
