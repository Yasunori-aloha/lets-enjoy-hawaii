$(document).on('change', '#user_image', function(e){
  // 変更するために選択した画像ファイルを変数に代入する。
  const imageFile = e.target.files[0];
  const fileReader = new FileReader();

  // 画像ファイルをurlにエンコードする。
  fileReader.readAsDataURL(imageFile);
  fileReader.onload = () => {
    $('.user_image').attr('src', fileReader.result);
  };
});