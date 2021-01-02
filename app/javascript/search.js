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
  const starRatingTarget = [
    "/shopping",
    "/landmark",
    "/leisure",
    "/rentacar",
    "/dinner",
    "/hotel",
    "/niihau",
    "/kauai",
    "/oahu",
    "/molokai",
    "/lanai",
    "/kahoolawe",
    "/maui",
    "/hawaii",
    "/restaurant",
    "/card-shop",
    "/aquarium",
    "/convenience-store",
    "/honolulu"
  ];
  // URLの中に配列に入っているパスが入っていれば、カテゴリーアイコンと5段階評価の表示を適用する。
  const conditions = $.inArray(url, starRatingTarget) !== -1 || /\/experiences\/[0-9]{1,}/.test(url)
  if (conditions) {
    // 'category_id'を取得して、その'id'に対応したアイコン画像用のクラスを配列から取得して追加させる。
    const categoryIcon = $("#category_icon");
    const categoryId = $("#category_id")[0].innerText;
    categoryIcon.addClass(`${categoryIcons[categoryId - 1]}`);
  }
  if (conditions || /\/search/) {
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
  if (/\/experiences\/[0-9]{1,}/.test(url) && !/\/experiences\/[0-9]{1,}\//.test(url)) {
    const showScoreArray = Array.from($('[id*="score_"]'));
    showScoreArray.reverse().forEach((element, index) => {
      const percent = element.innerText.match(/\d+/)[0];
      $(`#graph_score${index + 1}`).css("width", `${percent}%`);
    });
  }

  // パンくずリストのカテゴリーへのリンクにクラス名とHTTPメソッドの'POST'を付与する。
  if (/\/experiences\/[0-9]{1,}/.test(url)) {
    $("#breadcrumbs a:nth-child(2)").addClass("category search_btn");
    $("#breadcrumbs a:nth-child(2)")[0].dataset.method = 'post';
  }
});

$(function () {
  // '目的別検索'か'島名別検索'なのかを判断するためのクラス名をパラメーターに追加するための関数。
    $('.search_type_main, .search_map_main, .name_main, .menu, .show_info_left').on('click', '.search_btn', function(){
    const address = this.href;

    // '目的別'なのか'島名'での検索なのかを判断する為に付与しているクラス名を取得。
    const searchName = $(this).attr('class').match(/^.*(?= search_btn)/)[0];

    // CSRF対策のためのキーとトークンを取得する。
    const csrfParam = $('meta[name=csrf-param]').attr('content');
    const csrfToken = $('meta[name=csrf-token]').attr('content');

    const formSearch = $(`<form method='post' action='${address}'/>`).appendTo($('body'));

    // 'hidden属性'でクラス名とCSRF対策用トークンをパラメーターに追加する。
    $(`<input type='hidden' name='class' value='${searchName}'/>`).appendTo(formSearch);
    $(`<input type='hidden' name='${csrfParam}' value='${csrfToken}'/>`).appendTo(formSearch);

    formSearch.submit();
    return false
  });
});
