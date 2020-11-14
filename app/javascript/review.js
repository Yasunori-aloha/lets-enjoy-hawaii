'use strict';

$(function(){
  // '★'をホバーするとホバーした位置から左側にある'★'を全て表示変更させる。
  $('[id^="star_btn"]').on('mouseover', function(){
    const starId = $(this)[0].id.slice(-1)
    for (let index = starId; index > 0; index--){
      $(`#star_btn${index}`)[0].innerText = '★';
    }
  });
  $('[id^="star_btn"]').on('mouseout', function(){
    const starId = $(this)[0].id.slice(-1)
    for (let index = starId; index > 0; index--){
      $(`#star_btn${index}`)[0].innerText = '☆';
    }
  });
  // '★'をクリックすると、クリックした位置から左側の'★'が選択状態となり、ホバーを外しても表示が変更されたままになる。
  $('[id^="review_score_"]').on('click', function(){
    console.log($(this)[0].value);
  });
});