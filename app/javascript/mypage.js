'use strict';

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
        $('.picture_show_area').append(`<img src="${fileReader.result}" class="preview">`);
      };
    };
    fileReader.readAsDataURL(imageFile[index]);
  };
});