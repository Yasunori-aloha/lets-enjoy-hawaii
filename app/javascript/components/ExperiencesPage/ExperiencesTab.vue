<template>
  <ul class="experience__tabs__wrapper">
    <li class="tab active__tab">
      <span>概要</span>
    </li>
    <li class="two__line__tab">
      <span>口コミ</span>
      <br>
      <span class="number">({{  }}件)</span>
      <a href="" class="experience__link" />
    </li>
    <li class="two__line__tab">
      <span>写真</span>
      <br>
      <span class="number">({{  }}枚)</span>
      <a href="" class="experience__link" />
    </li>
  </ul>
</template>

<script>
export default {

};
</script>

<style scoped>
/* アクティビティ表示部分切り替えタブ表示欄 */
  .experience__tabs__wrapper{
    display: flex;
    height: 43px;
    border-bottom: 2px solid #ffa500;
    padding: 0 12px;
  }
  .tab{
    height: 43px;
    width: 86px;
    line-height: 15px;
    border: 2px solid #ccc;
    border-bottom: 2px solid #ffa500;
    border-radius: 4px 4px 0 0;
    margin-right: 4px;
    padding: 12px 0 0;
    font-size: 12px;
    color: #333333;
    text-align: center;
    cursor: pointer;
    position: relative;
  }
  .two__line__tab{
    height: 43px;
    width: 86px;
    line-height: 15px;
    border: 2px solid #ccc;
    border-bottom: 2px solid #ffa500;
    border-radius: 4px 4px 0 0;
    margin-right: 4px;
    padding: 6px 0 0;
    font-size: 12px;
    color: #333333;
    text-align: center;
    cursor: pointer;
    position: relative;
  }
  .number{
    font-size: 11px;
  }
  .experience__link{
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
  }
/* 選択されているタブ表示欄 */
  .active__tab{
    border: 2px solid #ffa500;
    border-bottom: 2px solid #ffffff;
    color: orangered;
    font-weight: bold;
    cursor: auto;
  }
</style>
