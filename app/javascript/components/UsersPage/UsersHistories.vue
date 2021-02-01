<template>
  <div class="my__page__main__right">
    <div class="user__histories__wrapper">
      <UsersPageMenu currentPage="行った場所" />
      <div class="user__histories__show__area">
        <ul v-if="historyIsExists" class="user__histories__list">
          <li v-for="(history, index) in userHistories" class="history__wrapper" :style="isNotRight(index + 1)">
            <div class="history__info">
              <ul class="history__time">
                <li>登録日：</li>
                <li class="historied__at">{{ historyTime(history) }}</li>
              </ul>
              <div class="history__release__btn">
                <i class="fas fa-times release__mark"></i>
                <span class="release__message">登録解除</span>
                <a :href="`/experiences/${history.experience.id}/histories`" data-remote="true" rel="nofollow" data-method="delete" class="history__release"></a>
              </div>
            </div>
            <div class="acitivity__picture">
              <img :src="historyActivityImage(history)" class="content__picture">
              <a :href="`/experiences/${history.experience.id}`" class="activity__picture__link"></a>
            </div>
            <div class="activity__info__wrapper">
              <a :href="`/experiences/${history.experience.id}`" class="activity__name link__hover">{{ history.experience.name }}</a>
              <p class="activity__place">{{ history.experience.area.island.name }} > {{ history.experience.area.name }}</p>
              <span class="histories__counts">
                <i class="fas fa-shoe-prints fa-rotate-270"></i>
                {{ history.experience.histories_counts }}
              </span>
              <form>
                <label for="history_comment" class="activity__comment__info">コメント ※個人情報は入力しないでください</label>
                <textarea v-model="history.comment" id="history_comment" name="history[comment]" maxlength="30" placeholder="ここにコメントを書くと便利です。（全角30文字以内・改行は受け付けません）" class="activity__comment"></textarea>
                <div class="save__btn">
                  <i class="fas fa-check check__mark"></i>
                  <span class="save__message">保存する</span>
                  <button @click.prevent="updateHistoryComment(history)" class="save__submit"></button>
                </div>
              </form>
            </div>
          </li>
        </ul>
        <span v-else class="not__contents">まだ訪問したアクティビティはありません。</span>
      </div>
    </div>
  </div>
</template>

<script>
import UsersPageMenu from '../UsersPage/UsersPageMenu.vue';
import { mapGetters } from "vuex";

export default {
  components: {
    UsersPageMenu,
  },
  computed: {
    ...mapGetters(["userData", "userHistories"]),
    historyIsExists() {
      return this.userHistories !== null;
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
    historyTime(history) {
      return history.created_at.slice(0, 10).replace(/-/g, '/');
    },
    historyActivityImage(history) {
      return `https://maps.googleapis.com/maps/api/streetview?size=800x600&location=${history.experience.latitude},${history.experience.longitude}&heading=${history.experience.heading}&pitch=${history.experience.pitch}&fov=${history.experience.fov}&zoom=${history.experience.zoom}&key=${process.env.GOOGLE_STREET_VIEW_KEY}`;
    },
    updateHistoryComment: async function(history) {
      let formData = new FormData();
      formData.append('history[comment]', history.comment);
      await this.$store.dispatch('updateHistoryComment', { userId: this.userData.id, historyId: history.id, formData });
    },
  },
};
</script>

<style scoped>
  .user__histories__wrapper{
    height: 100%;
    width: 776px;
    margin: 28px 0;
    padding: 0 17px;
    border-radius: 5px;
    color: black;
    display: block;
    background-color: rgba(255, 255, 255, 0.75);
  }
  .user__histories__show__area{
    min-height: calc(100vh - 369px);
    padding-top: 17px;
  }
/* 訪問記録一覧 */
  .user__histories__list{
    display: flex;
    width: 742px;
    flex-wrap: wrap;
  }
  .history__wrapper{
    width: 242px;
    border: 1px solid #808080;
    border-radius: 5px;
    margin-bottom: 17px;
    word-spacing: 0px;
    background-color: #fff;
    /* 右端じゃなければ'8px'付与する。 */
    margin-right: var(--margin-right);
  }
  .history__info{
    height: 36px;
    padding: 0px 7px;
    display: flex;
    justify-content: space-between;
  }
  .history__time{
    font-size: 11px;
  }
/* 訪問記録登録解除ボタン */
  .history__release__btn{
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
  .history__release{
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    opacity: 0;
    cursor: pointer;
  }
/* 訪問記録のアクティビティ画像部分 */
  .acitivity__picture{
    height: 181px;
    position: relative;
  }
  .content__picture{
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
/* アクティビティ情報欄 */
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
  .histories__counts{
    font-size: 20px;
  }
/* 訪問記録へのコメント欄 */
  .activity__comment__info{
    font-size: 10px;
    margin: 0px;
    font-weight: bold;
    color: #808080;
  }
  ::placeholder{
    padding: 2px;
    font-size: 10px;
    line-height: -20px;
  }
  .activity__comment{
    height: 35px;
    margin: 0;
    width: 100%;
    border: 1px solid #808080;
    font-size: 12px;
    resize: none;
  }
/* 訪問記録へのコメント保存ボタン */
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
/* 訪問記録がなかった場合の文字 */
  .not__contents{
    display: block;
    font-size: 18px;
    font-weight: bold;
    min-height: calc(100vh - 386);
    padding-bottom: 17px;
  }
</style>
