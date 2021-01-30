<template>
  <div class="my__page__main__right">
    <div class="user__favorites__wrapper">
      <div class="user__page__menu"></div>
      <div class="user__favorites__show__area">
        <ul class="user__favorites__list">
          <li class="favorite__wrapper">
            <div class="favorite__info">
              <ul class="favorite__time">
                <li></li>
                <li class="favorited__at"></li>
              </ul>
              <div class="favorite__reloease__btn">
                <i class="release__mark"></i><span class="release__message"></span>
                <div class="favorite__release"></div>
              </div>
            </div>
            <div class="activity_picture">
              <img src="" alt="" class="content_picture">
              <div class="activity__picture__link"></div>
            </div>
            <div class="activity__info__wrapper">
              <div class="activity__name link__hover"></div>
              <p class="activity__place"></p>
              <span class="favorites__counts"><i class="star__icon"></i></span>
              <form action="">
                <label for="" class="activity__comment__info"></label><input type="text" class="activity__comment">
                <div class="save__btn"></div>
              </form>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
export default {

};
</script>

<style scoped>
.user__favorites__wrapper{
  height: 100%;
  width: 776px;
  margin: 28px 0;
  padding: 0 17px;
  border-radius: 5px;
  color: black;
  display: block;
  background-color: rgba(255, 255, 255, 0.75);
}
.user__page__menu{
}
.user__favorites__show__area{
  min-height: calc(100vh - 369px);
  padding-top: 17px;
}
.user__favorites__list{
  display: flex;
  width: 742px;
  flex-wrap: wrap;
}

.activity_right_margin{
  margin-right: 8px;
}
.favorite__wrapper{
  width: 242px;
  border: 1px solid #808080;
  border-radius: 5px;
  margin-bottom: 17px;
  word-spacing: 0px;
  background-color: #fff;
}
.favorite__info{
  height: 36px;
  padding: 0px 7px;
  display: flex;
  justify-content: space-between;
}
.favorite__time{
  font-size: 11px;
}
.favorited__at{
}
.favorite__reloease__btn{
  background: linear-gradient(#ffffff, #e4e4e4);
  border: 1px solid #808080;
  border-radius: 3px;
  display: flex;
  font-size: 11px;
  height: 20px;
  margin: auto 0px;
  padding: 0 7px;
  position: relative;
}
.release__mark{
  margin: 3px 5px 0 0;
  color: #808080;
}
.release__message{
  font-weight: bold;
}
.favorite__release{
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  opacity: 0;
  cursor: pointer;
}
.activity_picture{
  height: 181px;
  position: relative;
}
.content_picture{
  height: 100%;
  width: 100%;
}
.activity__picture__link{

  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  opacity: 0;
  cursor: pointer;
}
.activity__info__wrapper{
  padding: 5px 7px 6px;
}
.activity__name{
  font-size: 14px;
  font-weight: bold;
  color: #0088de;
  margin: 0;
  text-decoration: underline;
}
.activity__place{
  font-size: 11px;
  margin: 1px 0 0 1px;
  }
.favorites__counts{
  font-size: 20px;
}
.star__icon{
  color: #ffa500;
}
.activity__comment__info{
  font-size: 10px;
  margin: 0px;
  font-weight: bold;
  color: #808080;
}
.activity__comment{
  height: 35px;
  margin: 0;
  width: 100%;
  border: 1px solid #808080;
  font-size: 12px;
  resize: none;
}
.save__btn{
  @include backgroundGradient();
  display: flex;
  height: 18px;
  width: 73px;
  margin: 0px 0px 0px auto;
  border: 1px solid #808080;
  border-radius: 3px;
  font-size: 11px;
  position: relative;
}
.check__mark{
  margin: 2px 3px 0px 6px;
  color: #808080;
}
.save__message{
  font-weight: bold;
}
.save__submit{
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  opacity: 0;
  cursor: pointer;
}
</style>
