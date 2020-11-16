'use strict';

$(function(){

  // プレビュー表示されている枚数を記録する変数。ページ更新ごとに値がリセットされる。
  let pictureWrapId = 0

  // 画像データを格納する箱を生成。
  let imageFileBox = new DataTransfer();

  // 画像添付用のinput要素を取得。
  let fileField = $('input[type=file]')[0];

  $(document).on('change', '#user_image, #review_images', function(){
    // 変更するために選択した画像ファイルを'配列に変換'して変数に代入する。
    const imageFileList = Array.from($('input[type=file]').prop('files'));
    
    imageFileList.forEach(imageFile => {
      const fileReader = new FileReader();
      
      imageFileBox.items.add(imageFile)
      fileField.files = imageFileBox.files

      // 画像ファイルを'URL'にエンコードする。
      fileReader.readAsDataURL(imageFile);
      fileReader.onload = () => {
        if (this.id === 'user_image') {
          $(`#${this.id}_set`).attr('src', fileReader.result);
        } else {
          // プレビュー用の要素を表示エリア内に追加していき、表示枚数記録用の変数に値を追加する。
          $('#picture_show_area').css('height', '100%');
          $('.picture_show_area').append(`<div id="preview_wrap${pictureWrapId}" class="preview_wrap" data-image="${imageFile.name}"/>`);
          $(`#preview_wrap${pictureWrapId}`).append(`<img src="${fileReader.result}" class="preview">`,`<div id="picture_delete${pictureWrapId}" class="picture_delete"/>`);
          $(`#picture_delete${pictureWrapId}`).append('<i class="far fa-window-close"/>', '<span id="change_link_delete" class="delete_btn">写真削除</span>');
          pictureWrapId += 1;
        };
      };
    });
  });

  // プレビューの'写真削除ボタン'をクリックすると、プレビューと添付していた画像ファイルを消去する。
  $(document).on('click','#change_link_delete', function(){
    const targetImage = $(this).parent().parent();
    if (fileField.files.length === 1) {
      $('input[type=file]').val(null)
      imageFileBox.clearData();
    } else {
      const targetName = $(targetImage).data('image');
      const fileFieldList = Array.from(fileField.files);
      fileFieldList.forEach((file, index) => {
        if (targetName === file.name) {
          imageFileBox.items.remove(index);
        }
      });
      fileField.files = imageFileBox.files
    };
    targetImage.remove();
    $('#picture_show_area').css('height', '215px');
    console.log(imageFileBox);
    console.log(fileField.files);
  });
});