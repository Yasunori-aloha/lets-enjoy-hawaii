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
          // プレビュー用の要素を表示エリア内に追加し、表示枚数記録用の変数に値を追加する。
          const previewArea = `
          <div id="preview_wrap${pictureWrapId}" class="preview_wrap" data-image="${imageFile.name}"/>
            <img src="${fileReader.result}" class="preview">
            <div id="picture_delete${pictureWrapId}" class="picture_delete"/>
              <i class="far fa-window-close"/></i>
              <span class="delete_btn">写真削除</span>`

          $('#picture_show_area').css('height', '100%');
          $('.picture_show_area').append(previewArea);
          pictureWrapId += 1;
        };
      };
    });
  });

  // プレビューの'写真削除ボタン'をクリックすると、プレビューと添付していた画像ファイルを消去する。
  $(document).on('click','[id^="picture_delete"]', function(){
    const targetImage = $(this).parent();
    // プレビュー画像が1枚だけならinput要素のvalueを全消去する。
    if (fileField.files.length === 1) {
      $('input[type=file]').val(null)
      imageFileBox.clearData();
      $('#picture_show_area').css('height', '215px');
    // プレビュー画像が複数枚なら、プレビュー要素生成時に付与した'data-image属性'を元に、FileListから画像を消去する。
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
  });
});