'use strict';

$(function(){

  // プレビュー表示されている枚数を記録する変数。ページ更新ごとに値がリセットされる。
  let pictureWrapId = 0

  $(document).on('change', '#user_image, #review_images', function(e){
    // 変更するために選択した画像ファイルを変数に代入する。
    const imageFile = e.target.files;
    
    // 画像ファイルの数だけ、処理を繰り返す
    for (let index = 0; index < e.target.files.length; index++) {
      const fileReader = new FileReader();
      // 画像ファイルをurlにエンコードする。
      fileReader.onload = () => {
        if (this.id === 'user_image') {
          $(`#${this.id}_set`).attr('src', fileReader.result);
        } else {
          // プレビュー用の要素を表示エリア内に追加していき、表示枚数記録用の変数に値を追加する。
          $('#picture_show_area').css('height', '100%');
          $('.picture_show_area').append(`<div id="preview_wrap${pictureWrapId}" class="preview_wrap"/>`);
          $(`#preview_wrap${pictureWrapId}`).append(`<img src="${fileReader.result}" class="preview">`,`<div id="picture_delete${pictureWrapId}" class="picture_delete"/>`);
          $(`#picture_delete${pictureWrapId}`).append('<i class="far fa-window-close"/>', '<span id="change_link_delete" class="delete_btn">写真削除</span>');
          pictureWrapId += 1;
        };
      };
      fileReader.readAsDataURL(imageFile[index]);
    };
  });
});