'use strict';

$(function(){

  let clickedId = 0

  // '★'をクリックした位置から左側の'★'がホバーを外しても表示が変更されたままで、クリックした位置から右側が非選択状態になる。
  $('[id^="review_score_"]').on('click', function(){
    clickedId = Number($(this)[0].value);
    for (let index = (clickedId + 1); index <= 5; index++){
      $(`#star_btn${index}`)[0].innerText = '☆';
    };
  });
  $('[id^="star_btn"]').on({
    // '★'をホバーするとホバーした位置から左側にある'★'を全て表示変更させる。
    'mouseover': function(){
      const starId = $(this)[0].id.slice(-1);
      for (let index = starId; index > 0; index--){
        $(`#star_btn${index}`)[0].innerText = '★';
      };
    },
    // '★'のホバーを外すと、クリックされていない部分を'☆'状態に戻す。
    'mouseout': function(){
      const starId = $(this)[0].id.slice(-1);
      for (let index = starId; index > clickedId; index--){
        $(`#star_btn${index}`)[0].innerText = '☆';
      };
    }
  });

  $('#sort_score').on('click', function(){
    const reviewList = $('.review_list li');
    reviewList.sort(function(a,b){
      const aScore = Number($(a).find('.exp_score').text());
      const bScore = Number($(b).find('.exp_score').text());
      return bScore - aScore;
    });
    $('.review_list').empty();
    $('.review_list').append(reviewList);
  });

});