'use strict';

$(function(){

  let clickedId = 0
  // 口コミページ表示直後は投稿日順で表示されている為、2を変数に代入している。
  let activeSortId = 2

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

  // 並び替えの'評価順・投稿日順'ボタンをクリックすると、アクティビティの評価点・投稿日の降順に表示を変更する。
  $('[id*="_sort_"]').on('click', function(){
    const sortName = this.id.match(/(.*)(?=_sort_)/)[0]
    const sortId = Number(this.id.match(/\d/)[0]);
    // すでに選択されている並び順では、動作しない様に否定文で分岐させる。
    if (!(sortId === activeSortId)) {
      // 表示している口コミの要素一覧を変数に格納する。
      const reviewList = $('.review_list li');
      reviewList.sort(function(a,b){
        const aText = $(a).find(`.review_sort_material${sortId}`).text();
        const bText = $(b).find(`.review_sort_material${sortId}`).text();
        if (aText > bText) {
          return -1
        } else {
          return 1
        }
      });
      $(`#review_sort_${activeSortId}`).removeClass('active_sort').addClass('change_link');
      // 選択した並び順のID数値を再代入している。
      activeSortId = sortId;
      $(this).addClass('active_sort').removeClass('change_link').removeClass('link_hover');
      $('.review_list').empty();
      $('.review_list').append(reviewList);
      $('.review_list').addClass('active_fade');
      setTimeout(function(){
        $('.review_list').removeClass('active_fade');
      }, 500);
    }
  });

});