'use strict';

$(window).on('load',function(){
  const url = location.pathname;
  const conditions = (url == '/shopping') || (url == '/landmark') || (url == '/leisure') || (url == '/rentacar') || (url == '/dinner') || (url == '/hotel')
  if(conditions) {
    // exp.scoreの点数を取得して、変数に代入。
    const expScore = $('#exp_score')[0].innerText;

    // `expScore`に'20'を乗算することにより'%'の数値にして、`star_rating`の'width'プロパティの値に設定する。
    const starRatingPersent = expScore * 20;
    $('#star_rating').width(`${starRatingPersent}%`);
  }
  });