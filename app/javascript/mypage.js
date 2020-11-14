'use strict';

$(document).on('change', '#user_image, #review_images', function(e){
  // 変更するために選択した画像ファイルを変数に代入する。
  const imageFile = e.target.files[0];
  const fileReader = new FileReader();

  // 画像ファイルをurlにエンコードする。
  fileReader.readAsDataURL(imageFile);
  console.log(e.target.files);
  fileReader.onload = () => {
    $(`#${this.id}_set`).attr('src', fileReader.result);
  };
});