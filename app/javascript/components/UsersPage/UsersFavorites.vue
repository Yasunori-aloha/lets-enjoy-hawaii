<template>
  <div class="my__page__main__right">
    <div class="user__favorites__wrapper">
      <div class="user__page__menu">
        <div class="breadcrumbs">
          <router-link :to="`/users/${userData.id}`" class="link__hover" >マイページトップ</router-link>
          <span class="current"> › お気に入りした場所</span>
        </div>
      </div>
      <div class="user__favorites__show__area">
        <ul v-if="favoriteIsExists" class="user__favorites__list">
          <li v-for="(favorite, index) in userFavorites" class="favorite__wrapper" :class="{favorite__margin__right: isNotRight[index] }">
            <div class="favorite__info">
              <ul class="favorite__time">
                <li>登録日：</li>
                <li class="favorited__at">{{ favoriteTime(favorite) }}</li>
              </ul>
              <div class="favorite__reloease__btn">
                <i class="fas fa-times release__mark"></i><span class="release__message">登録解除</span>
                <a :href="`/experiences/${userFavoriteExperiences[index].id}/favorites`" data-remote="true" rel="nofollow" data-method="delete" class="favorite__release"></a>
              </div>
            </div>
            <div class="activity_picture">
              <img :src="favoriteActivityImage(favorite, index)" alt="" class="content_picture">
              <a :href="`/experiences/${userFavoriteExperiences[index].id}`" class="activity__picture__link"></a>
            </div>
            <div class="activity__info__wrapper">
              <a :href="`/experiences/${userFavoriteExperiences[index].id}`" class="activity__name link__hover">{{ userFavoriteExperiences[index].attributes.name }}</a>
              <p class="activity__place">{{ userFavoriteExperiences[index].attributes.name }} > {{ userFavoriteExperiences[index].attributes.name }}</p>
              <span class="favorites__counts">
              <i class="fas fa-star star__icon"></i>
              {{ experienceFavoriteCounts(index) }}
              </span>
              <form >
                <label for="favorite_comment" class="activity__comment__info">コメント ※個人情報は入力しないでください</label>
                <textarea v-model="comment[index]" id="favorite_comment" name="favorite[comment]" maxlength="30" placeholder="ここにコメントを書くと便利です。（全角30文字以内・改行は受け付けません）" class="activity__comment" />
                <div class="save__btn">
                  <i class="fas fa-check check__mark" />
                  <span class="save__message">保存する</span>
                  <button @click.prevent="updateFavoriteComment(favorite, index)" class="save__submit"></button>
                </div>
              </form>
            </div>
          </li>
        </ul>
        <span v-else class="not__contents">まだお気に入りしたアクティビティはありません。</span>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  data() {
    return {
      comment: [],
      isNotRight: [],
    }
  },
  computed: {
    ...mapGetters(["userData", "userFavorites"]),
    favoriteIsExists() {
      return this.userFavorites !== null;
    },
  },
  methods: {
    favoriteTime(favorite) {
      return favorite['created_at'].slice(0, 10).replace(/-/g, '/');
    },
    favoriteActivityImage(favorite, index) {
      return `https://maps.googleapis.com/maps/api/streetview?size=800x600&location=${favorite.experience.latitude},${favorite.experience.longitude}&heading=${favorite.experience.heading}&pitch=${favorite.experience.pitch}&fov=${favorite.experience.fov}&zoom=${favorite.experience.zoom}&key=${process.env.GOOGLE_STREET_VIEW_KEY}`;
    },
    experienceFavoriteCounts(index) {
      if (this.userFavoriteExperiences[index].relationships.favorites.data) {
        return this.userFavoriteExperiences[index].relationships.favorites.data.length;
      } else {
        return 0;
      }
    },
    updateFavoriteComment: async function(favorite, index) {
      await this.$store.dispatch('updateFavoriteComment', { userId: this.userData.id, favoriteId: favorite.id, comment: this.comment, index: index });
    },
  },
  created() {
    // console.log(this.userFavorites);
    // お気に入りのコメントを抽出して右端以外のお気に入りに'margin-right'を付与する。
    this.userFavorites.forEach( (e, index) => {
      this.comment.push(e.comment);
      if ((index + 1) % 3 !== 0) {
        this.isNotRight.push(true);
      } else {
        this.isNotRight.push(false);
      }
    });
  },
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
  text-align: left;
  font-size: 12px;
  border-bottom: 1px dotted black;
  width: 100%;
  padding: 10px 0 5px 0;
  margin: 0 auto;
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
.favorite__margin__right{
  margin-right: 8px;
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
::placeholder{
  padding: 2px;
  font-size: 10px;
  line-height: -20px;
}
.save__btn{
  background: linear-gradient(#ffffff, #e4e4e4);
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
.not__contents{
  display: block;
  font-size: 18px;
  font-weight: bold;
  min-height: calc(100vh - 386);
  padding-bottom: 17px;
}
</style>
