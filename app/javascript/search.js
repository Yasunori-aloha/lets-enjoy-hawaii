'use strict';

$(window).on('load',function(){
  const categoryIcons = [
    'assets/hotel_icon.png',
    'assets/lunch_icon.png',
    'assets/car_icon.png',
    'assets/leisure_icon.png',
    'assets/landmark_icon.png',
    'assets/shopping_icon.png'
  ];
  const url = location.pathname;
  const conditions = (url == '/shopping') || (url == '/landmark') || (url == '/leisure') || (url == '/rentacar') || (url == '/dinner') || (url == '/hotel');
  if(conditions) {
    // 'category_id'を取得して、その'id'に対応したアイコン画像を配列から取得して表示させる。
    const categoryIcon = $('#category_icon')[0];
    const categoryId = $('#category_id')[0].innerText;
    categoryIcon.src = categoryIcons[categoryId - 1];

    // exp.scoreクラスを複数取得して、ノードリストから配列へ変換し、各要素毎に処理をしていく。
    const expScoreArray = Array.from($('.exp_score'));
    expScoreArray.forEach((element, index) => {
      const expScore = element.innerText;
      // 'expScore'に'20'を乗算することにより'%'の数値にして、`star_rating`の'width'プロパティの値に設定する。
      const starRatingPersent = expScore * 20;
      $(`#star_rating${index}`).css('width', `${starRatingPersent}%`);
    });
  }
});