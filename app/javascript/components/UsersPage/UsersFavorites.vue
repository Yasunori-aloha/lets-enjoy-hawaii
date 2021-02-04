<template>
  <div class="my__page__main__right">
    <div class="user__favorites__wrapper">
      <UsersPageMenu currentPage="お気に入りした場所" />
      <div class="user__favorites__show__area">
        <ul v-if="favoriteIsExists" class="user__favorites__list">
          <li v-for="(favorite, index) in userFavorites" :key="favorite.id" class="favorite__wrapper" :style="isNotRight(index + 1)">
            <div class="favorite__info">
              <ul class="favorite__time">
                <li>登録日：</li>
                <li class="favorited__at">{{ favoriteTime(favorite) }}</li>
              </ul>
              <button @click="removeFavorite(favorite, index)" class="favorite__release__btn">
                <i class="fas fa-times release__mark"></i>
                <span class="release__message">登録解除</span>
              </button>
            </div>
            <div class="activity__picture">
              <ActivityPicutre :activity="favorite" />
              <a :href="`/experiences/${favorite.experience.id}`" class="activity__picture__link"></a>
            </div>
            <div class="activity__info__wrapper">
              <a :href="`/experiences/${favorite.experience.id}`" class="activity__name link__hover">{{ favorite.experience.name }}</a>
              <p class="activity__place">{{ favorite.experience.area.island.name }} > {{ favorite.experience.area.name }}</p>
              <span class="favorites__counts">
              <i class="fas fa-star star__icon"></i>
              {{ favorite.experience.favorite_counts }}
              </span>
              <form >
                <label for="favorite_comment" class="activity__comment__info">コメント ※個人情報は入力しないでください</label>
                <textarea v-model="favoriteComments[favorite.id]" id="favorite_comment" name="favorite[comment]" maxlength="30" placeholder="ここにコメントを書くと便利です。（全角30文字以内・改行は受け付けません）" class="activity__comment" />
                <div class="save__btn">
                  <i class="fas fa-check check__mark" />
                  <span class="save__message">保存する</span>
                  <button @click.prevent="updateFavoriteComment(favorite)" class="save__submit"></button>
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
import UsersPageMenu from '../UsersPage/UsersPageMenu.vue';
import ActivityPicutre from '../ActivityPicture.vue';
import { mapGetters } from "vuex";

export default {
  components: {
    UsersPageMenu,
    ActivityPicutre,
  },
  data() {
    return {
      favoriteComments: {},
    }
  },
  computed: {
    ...mapGetters(["userData", "userFavorites"]),
    favoriteIsExists() {
      return this.userData.favorites_counts !== 0;
    },
  },
  methods: {
    isNotRight(index) {
      if (index % 3 !== 0) {
        return {
          '--margin-right': '8px',
          };
      } else {
        return {
          '--margin-right': '0px'
        };
      }
    },
    favoriteTime(favorite) {
      return favorite['created_at'].slice(0, 10).replace(/-/g, '/');
    },
    updateFavoriteComment: async function(favorite) {
      let formData = new FormData();
      formData.append('favorite[comment]', this.favoriteComments[favorite.id]);
      await this.$store.dispatch('updateFavoriteComment',
      {
        userId: this.userData.id,
        favoriteId: favorite.id,
        formData,
      }).then(response => {
        favorite.comment = this.favoriteComments[favorite.id];
      });
    },
    // 'index番号も渡して、登録解除が成功したら連想配列のindex番号要素を削除する。
    removeFavorite: async function(favorite, index) {
      await this.$store.dispatch('removeFavorite',
      {
        userId: this.userData.id,
        favoriteId: favorite.id,
      }).then(response => {
        this.userFavorites.splice(index, 1);
        this.userData.favorites_counts -= 1;
      });
    },
  },
  created() {
    this.userFavorites.forEach(e => {
      this.favoriteComments[e.id] = e.comment;
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
.user__favorites__show__area{
  min-height: calc(100vh - 369px);
  padding-top: 17px;
}
.user__favorites__list{
  display: flex;
  width: 742px;
  flex-wrap: wrap;
}
.favorite__wrapper{
  width: 242px;
  border: 1px solid #808080;
  border-radius: 5px;
  margin-bottom: 17px;
  word-spacing: 0px;
  background-color: #fff;
  /* 右端じゃなければ'8px'付与する。 */
  margin-right: var(--margin-right);
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
.favorite__release__btn{
  background: linear-gradient(#ffffff, #e4e4e4);
  border: 1px solid #808080;
  border-radius: 3px;
  display: flex;
  font-size: 11px;
  height: 20px;
  margin: auto 0px;
  padding: 0 7px;
  cursor: pointer;
}
.release__mark{
  margin: 3px 5px 0 0;
  color: #808080;
}
.release__message{
  font-weight: bold;
}
.activity__picture{
  height: 181px;
  position: relative;
}
.experience__picture{
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
