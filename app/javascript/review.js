'use strict';

$(function(){

  let clickedId = 0
  let reviewList = null

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

  // 並び替えの'評価順'ボタンをクリックすると、アクティビティの評価点の降順に表示を変更する。
  $('#sort_score').on('click', function(){
    reviewList = $('.review_list li');
    reviewList.sort(function(a,b){
      const aScore = Number($(a).find('.exp_score').text());
      const bScore = Number($(b).find('.exp_score').text());
      return bScore - aScore;
    });
    $('#sort_created_at').removeClass('active_sort')
    $('#sort_score').addClass('active_sort')
    $('.review_list').empty();
    $('.review_list').append(reviewList);
  });
  // 並び替えの'投稿日順'ボタンをクリックすると、アクティビティの投稿日の降順に表示を変更する。
  $('#sort_created_at').on('click', function(){
    reviewList = $('.review_list li');
    reviewList.sort(function(a,b){
      const aTime = $(a).find('.review_created_at').text();
      const bTime = $(b).find('.review_created_at').text();
      if (aTime > bTime) {
        return -1
      } else {
        return 1
      }
    });
    console.log(reviewList);
    $('#sort_score').removeClass('active_sort')
    $('#sort_created_at').addClass('active_sort')
    $('.review_list').empty();
    $('.review_list').append(reviewList);
  });

});