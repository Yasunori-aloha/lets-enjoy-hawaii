<template>
  <div class="social__login">
    <span class="social__login__title">こちらもご利用いただけます</span>
    <ul class="social__login__list">
      <li id="google__login" class="google__login">
        <a href="/users/auth/google_oauth2" rel="nofollow" data-method="post" class="social__login__link"><i class="fab fa-google"></i></a>
      </li>
      <li id="facebook__login">
        <a href="/users/auth/facebook" rel="nofollow" data-method="post" class="social__login__link">
          <img src="/assets/f_logo_RGB-Blue_58.png" height="30px" width="30px">
        </a>
      </li>
    </ul>
  </div>
</template>

<script>
export default {

};
</script>

<style scoped>
.social__login{
  width: 100%;
  text-align: center;
  border-top: 1px solid #ccc;
  margin-top: 30px;
  padding-top: 15px;
  position: relative;
}
.social__login__title{
  width: 50%;
  line-height: 20px;
  font-size: 14px;
  display: inline-block;
  text-align: center;
  margin: 0 -25%;
  position: absolute;
  top: -10px;
  background-color: #fff;
}
.social__login__list{
  height: 92px;
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  margin: 0 auto;
}
.google__login{
  position: relative;
}
i{
  color: #000000;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 26px;
}
.social__login__link{
  height: 72px;
  width: 72px;
  display: flex;
  align-items: center;
  font-size: 12px;
  border: 1px solid #e5e5e5;
  border-radius: 6px;
  margin: 10px;
}
img{
  margin: 0 auto;
}
</style>
