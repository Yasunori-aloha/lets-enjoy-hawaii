"use strict";

$(function () {
  let clickedId = 0;
  // 表示ページに'並び替えボタン'があれば、初期選択されているボタンの'id'を'activeSortId'
  let activeSortId = null;
  if ($(".active_sort").length) {
    activeSortId = Number($(".active_sort")[0].id.match(/\d/)[0]);
  }

  // '★'をクリックした位置から左側の'★'がホバーを外しても表示が変更されたままで、クリックした位置から右側が非選択状態になる。
  $('[id^="review_score_"]').on("click", function () {
    clickedId = Number($(this)[0].value);
    for (let index = clickedId + 1; index <= 5; index++) {
      $(`#star_btn${index}`)[0].innerText = "☆";
    }
  });
  $('[id^="star_btn"]').on({
    // '★'をホバーするとホバーした位置から左側にある'★'を全て表示変更させる。
    mouseover: function () {
      const starId = $(this)[0].id.slice(-1);
      for (let index = starId; index > 0; index--) {
        $(`#star_btn${index}`)[0].innerText = "★";
      }
    },
    // '★'のホバーを外すと、クリックされていない部分を'☆'状態に戻す。
    mouseout: function () {
      const starId = $(this)[0].id.slice(-1);
      for (let index = starId; index > clickedId; index--) {
        $(`#star_btn${index}`)[0].innerText = "☆";
      }
    },
  });

  // 並び替え用ボタンをクリックすると、ボタンに表示されている項目の降順に表示を変更する。
  $('[id*="_sort_"]').on("click", function () {
    const sortName = this.id.match(/(.*)(?=_sort_)/)[0];
    const sortId = Number(this.id.match(/\d/)[0]);
    // すでに選択されている並び順では、動作しない様に否定文で分岐させる。
    if (!(sortId === activeSortId)) {
      // 表示している要素一覧を変数に格納する。
      const sortList = $(`.${sortName}_list li`);
      sortList.sort(function (a, b) {
        const aText = $(a).find(`.${sortName}_sort_material${sortId}`).text();
        const bText = $(b).find(`.${sortName}_sort_material${sortId}`).text();
        if (aText > bText) {
          return -1;
        } else {
          return 1;
        }
      });
      $(`#${sortName}_sort_${activeSortId}`).removeClass("active_sort").addClass("link_hover");
      // 選択した並び順のID数値を再代入している。
      activeSortId = sortId;
      $(this).addClass("active_sort").removeClass("link_hover");
      $(`.${sortName}_list`).empty().append(sortList).addClass("active_fade");
      setTimeout(function () {
        $(`.${sortName}_list`).removeClass("active_fade");
      }, 500);
    }
  });

  if ($('.favorites_activity_wrapper').length) {
    // お気に入りアクティビティ一覧の右端以外に、'margin-right'を付与する。
    $('.favorites_activity_wrapper').each( function (index, element) {
      // 'id'の数値が3の倍数以外なら、付与する。
      if ((Number(element.id.match(/\d/)[0]) % 3) !== 0) {
        $(this).addClass('favorites_right_margin');
      }
    });
    // コンテンツエリアの'height'が背景エリアの'height'を超えた場合は、'height'を上書きする。
    const myPageContentsHeadHeight = Number($('.mypage_contents_head').css('height').match(/\d{1,}/)[0]);
    const myPageContentsMainHeight = Number($('.mypage_contents_main').css('height').match(/\d{1,}/)[0]);
    // 28pxは余白分
    const myPageContentsHeiht = myPageContentsHeadHeight + myPageContentsMainHeight + 28;
    const newMyPageContentsMainHeiht = myPageContentsMainHeight + 28;
    console.log(myPageContentsHeiht);

    $('.mypage_wrapper').css('height', `${myPageContentsHeiht}px`);
    $('.mypage_main').css('height', `${myPageContentsHeiht}px`);
    $('.mypage_contents_main_left').css('height', `${newMyPageContentsMainHeiht}px`);
    // console.log();
  }
});
