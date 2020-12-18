'use strict';

$(function(){
  const errorInput = { 'background-color': '#ffff00', 'border': '1px solid #ff0000'}
  // 会員登録入力フォームのフォーカスが外れた時にバリデーションが正しいが判定する関数。
  $('.signin_up_input').on('blur', function(){
    $(this).next().remove();
    $(this).css({ 'background-color': 'white', 'border': '1px solid #ccc' });
    // フォーカスが外れた時に、何も入力がなければ入力を促すメッセージを表示させる。
    if (!(this.value)) {
      $(this).parent().append('<span class="signin_up_error_message">この項目は必須です</span>');
      $(this).css(errorInput);
    } else {
      // フォーカスが外れた際に、その入力フォームのid名の'user_'以降の文字列によって分岐させる。
      switch (this.id.match(/(?<=user_).*$/)[0]) {
        case 'email':
          if (!(this.value.match(/@/))) {
            $(this).parent().append('<span class="signin_up_error_message">メールアドレスに「@」が挿入されておりません</span>');
            $(this).css(errorInput);
          }
          break;
        case 'password':
          // パスワードが8文字以下の場合。
          if (!(this.value.match(/.{8,}/))) {
            $(this).parent().append('<span class="signin_up_error_message">パスワードは8文字以上必要です</span>');
            $(this).css(errorInput);
          } else {
            // 数字が入っていない場合。
            if (this.value.match(/^(?!.*[0-9]).*$/)) {
            $(this).parent().append('<span class="signin_up_error_message">数字が挿入されておりません</span>');
            $(this).css(errorInput);
            // 英字が入っていない場合。
            } else if (this.value.match(/^(?!.*[a-zA-Z]).*$/)) {
            $(this).parent().append('<span class="signin_up_error_message">英字が挿入されておりません</span>');
            $(this).css(errorInput);
            } else if (this.value.match(/^(?!.*[!-\/:-@\[-`\{-~].*[!-\/:-@\[-`\{-~]).*$/)) {
              $(this).parent().append('<span class="signin_up_error_message">記号は2回以上が必要です</span>');
              $(this).css(errorInput);
            }
          }
          break;
        case 'password_confirmation':
          if (!(this.value === $('#user_password')[0].value)) {
            $(this).parent().append('<span class="signin_up_error_message">パスワードと同じ内容を入力してください</span>');
            $(this).css(errorInput);
          }
          break;
      }
    }
  });
});
