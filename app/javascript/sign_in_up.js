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
          if (!(this.value.match(/@/))) {
            $(this).parent().append('<span class="signin_up_error_message">メールアドレスに「@」が挿入されておりません</span>');
          }
          break;
        case 'password':
          // パスワードが8文字以下の場合。
          if (!(this.value.match(/.{8,}/))) {
            $(this).parent().append('<span class="signin_up_error_message">パスワードは8文字以上必要です</span>');
          } else {
            // 数字が入っていない場合。
            if (this.value.match(/^(?!.*[0-9]).*$/)) {
            $(this).parent().append('<span class="signin_up_error_message">数字が挿入されておりません</span>');
            // 英字が入っていない場合。
            } else if (this.value.match(/^(?!.*[a-zA-Z]).*$/)) {
            $(this).parent().append('<span class="signin_up_error_message">英字が挿入されておりません</span>');
            } else if (this.value.match(/^(?!.*[!-\/:-@\[-`\{-~].*[!-\/:-@\[-`\{-~]).*$/)) {
              $(this).parent().append('<span class="signin_up_error_message">記号は2回以上が必要です</span>');
            }
          }
          break;
        case 'password_confirmation':
          if (!(this.value === $('#user_password')[0].value)) {
            $(this).parent().append('<span class="signin_up_error_message">パスワードと同じ内容を入力してください</span>');
          }
          break;
      }
    }
  });
});
