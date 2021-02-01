<template>
  <div class="my__page__main__right">
    <div class="user__edit__wrapper">
      <UsersPageMenu currentPage="会員情報の確認・変更" />
      <p class="guest__user__alert"></p>
      <form action="" class="edit__user">
        <ul>
          <li class="input__field">
            <label for="user_name">お名前</label>
            <input v-model="userData.name" id="user_name" type="text" name="user[name]" autocomplete="name" class="edit__user__form">
          </li>
          <li class="input__field">
            <label for="user_email">メールアドレス</label>
            <input v-model="userData.email" id="user_email" type="text" name="user[email]" autocomplete="email" autocorrect="off" autocapitalize="off" class="edit__user__form">
          </li>
          <li class="input__field">
            <label for="user_introduce" class="text__top">自己紹介</label>
            <textarea v-model="userData.introduce" id="user_introduce" name="user[introduce]" cols="64" rows="8" class="edit__user__form"></textarea>
          </li>
          <li class="image__field">
            <label for="user_image" class="text__top">アイコン画像</label>
            <label for="user_image">
              <img src="" class="user__image">
            </label>
            <input id="user_image" type="file" name="user[image]" class="hidden">
          </li>
        </ul>
        <button @click.prevent="updateUserData()" class="button__cv update__btn btn__hover">更新する</button>
      </form>
    </div>
  </div>
</template>

<script>
import UsersPageMenu from '../UsersPage/UsersPageMenu.vue';

export default {
  components: {
    UsersPageMenu,
  },
  computed: {
    userData() {
      return this.$store.getters.userData;
    },
  },
  methods: {
    updateUserData() {
      console.log('test');
    },
  },
};
</script>

<style scoped>
  .user__edit__wrapper{
    height: 100%;
    width: 100%;
    border-radius: 5px;
    margin: 28px 0;
    padding: 0 17px;
    background-color: rgba(255, 255, 255, 0.75);
    color: black;
    display: block;
  }
/* ゲストユーザーアラート */
  .guest__user__alert{
    color: red;
    margin: 0;
    padding-top: 17px;
    text-align: center;
  }
/* ユーザー情報更新欄 */
  .edit__user{
    padding-top: 17px;
    text-align: end;
  }
/* ユーザー情報入力欄 */
  .input__field{
    width: 100%;
    margin-bottom: 10px;
  }
  .edit__user__form{
    resize: none;
    width: calc(100% - 120px);
    border: 1px solid gray;
    border-radius: 6px;
    padding: 5px;
  }
  .text__top{
    vertical-align: top;
  }
  .image__field{
    text-align: left;
    padding-left: 20px;
  }
  .user__image{
    height: 150px;
    width: 150px;
    border-radius: 10px;
    border: 1px solid gray;
    cursor: pointer;
  }
  .hidden{
    display: none;
  }
  .update__btn{
    height: 54px;
    width: 300px;
    font-size: 18px;
    margin: 17px 199px;
    background-color: #90b200;
  }
</style>
