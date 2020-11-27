'use strict';

$(function(){
  // 会員登録入力フォームのフォーカスが外れた時にバリデーションが正しいが判定する関数。
  $('.signin_up_input').on('blur', function(){
    if (!(this.value)) {
      $(this).parent().append('<span class="signin_up_error_message">この項目は必須です</span>');
    } else {
      $(this).next().remove();
    }
  });
});
