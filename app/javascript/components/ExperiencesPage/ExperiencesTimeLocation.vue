<template>
  <div>
    <ul class="experience__business__hours">
      <li class="business__hours__info">
        <span>営業時間</span>
      </li>
      <li class="business__hours__main">
        <span>{{  }} 〜 {{  }}</span>
      </li>
    </ul>
    <ul class="experience__location">
      <div class="location__info">
        <span>所在地</span>
      </div>
      <div class="locaiton__main">
        <span class="location__postal__code">{{  }}</span>
        <span class="location__address">{{  }}</span>
      </div>
    </ul>
  </div>
</template>

<script>
export default {

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
</style>
