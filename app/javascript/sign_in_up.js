'use strict';

$(function(){
  // 会員登録入力フォームのフォーカスが外れた時にバリデーションが正しいが判定する関数。
  $('.signin_up_input').on('blur', function(){
    $(this).next().remove();
    // フォーカスが外れた時に、何も入力がなければ入力を促すメッセージを表示させる。
    if (!(this.value)) {
      $(this).parent().append('<span class="signin_up_error_message">この項目は必須です</span>');
    } else {
      // フォーカスが外れた際に、その入力フォームのid名の'user_'以降の文字列によって分岐させる。
      switch (this.id.match(/(?<=user_).*$/)[0]) {
        case 'email':
          console.log('email');
          break;
        case 'password':
          console.log('password');
          break;
        case 'password_confirmation':
          console.log('password_confirmation');
          break;
      }
    }
  });
});
