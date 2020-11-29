"use strict";

$(window).on("load", function () {
  const categoryIcons = [
    "hotel_icon",
    "lunch_icon",
    "car_icon",
    "leisure_icon",
    "landmark_icon",
    "shopping_icon",
  ];
  const url = location.pathname;
  const conditions =
    url == "/shopping" ||
    url == "/landmark" ||
    url == "/leisure" ||
    url == "/rentacar" ||
    url == "/dinner" ||
    url == "/hotel" ||
    /\/experiences\/[0-9]{1,}/.test(url);
  if (conditions) {
    // 'category_id'を取得して、その'id'に対応したアイコン画像用のクラスを配列から取得して追加させる。
    const categoryIcon = $("#category_icon");
    const categoryId = $("#category_id")[0].innerText;
    categoryIcon.addClass(`${categoryIcons[categoryId - 1]}`);
  }
  if (conditions) {
    // exp_scoreクラスを複数取得して、ノードリストから配列へ変換し、各要素毎に処理をしていく。
    const expScoreArray = Array.from($(".exp_score"));
    expScoreArray.forEach((element, index) => {
      const expScore = element.innerText;
      // 'expScore'に'20'を乗算することにより'%'の数値にして、`star_rating`の'width'プロパティの値に設定する。
      const starRatingPercent = expScore * 20;
      $(`#star_rating${index}`).css("width", `${starRatingPercent}%`);
    });
  }
  // 詳細ページの5段階評価ごとの'%'を取得して数値に対応したグラフを表示させる。
  if (
    /\/experiences\/[0-9]{1,}/.test(url) &&
    !/\/experiences\/[0-9]{1,}\//.test(url)
  ) {
    const showScoreArray = Array.from($('[id*="score_"]'));
    showScoreArray.reverse().forEach((element, index) => {
      const percent = element.innerText.match(/\d+/)[0];
      $(`#graph_score${index + 1}`).css("width", `${percent}%`);
    });
  }
});

$(function () {
  // 'id名'に'change'と入っている要素をホバーしている時だけリンクの表示を変更させる。
  $(document).on("mouseover mouseout", '[class*="change_link"]', function () {
    $(this).toggleClass("link_hover");
  });
  // 'ボタン'にホバーすると表示色を変更させる。
  $('[id^="btn"]').on("mouseover mouseout", function () {
    $(this).toggleClass("btn_hover");
  });

  $('.search_btn').on('click', function(e){
    e.preventDefault();
    const address = this.href;
    // const searchName = this
    console.log($(this).attr('class').match(/^.*(?= search_btn)/)[0]);
  });
});
