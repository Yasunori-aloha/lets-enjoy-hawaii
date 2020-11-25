'use strict';

// お気に入りボタンをクリックすると、非同期でDBに値を登録して、お気に入りボタンの表示を変更する。
$(function(){
  $('#favorite_btn').on('click', function (e) {
    const expId = location.pathname.match(/\d/)[0];
    // console.log();
    const XHR = new XMLHttpRequest();
    XHR.open('POST', `/experiences/${expId}/favorites`, true);

    e.preventDefault();
  })
});
