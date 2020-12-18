'use strict';

$(function(){
  // 地図画像を表示しているimageタグを取得。
  const mapImage = $('#map_image')[0];
  // 地図の表示で使用する画像を配列で変数に格納。
  const images = [
    'assets/hawaiian_islands_niihau.png',
    'assets/hawaiian_islands_oahu.png',
    'assets/hawaiian_islands_kahoolawe.png',
    'assets/hawaiian_islands_lanai.png',
    'assets/hawaiian_islands_molokai.png',
    'assets/hawaiian_islands_maui.png',
    'assets/hawaiian_islands_kauai.png',
    'assets/hawaiian_islands_island_of_hawaii.png',
    'assets/hawaiian_islands.png',
  ];
  {
    $('map, .island_name').on('mouseover', function (){
      // カーソルが乗っている要素を取得し、取得した要素に対応する地図を表示色変更させる。
      const target = ($(':hover').length - 1);
      const hoverId = $(':hover')[target].dataset.id;
      mapImage.src = images[hoverId];
    });
    // カーソルが要素から外れたら、地図表示を元に戻す。
    $('map, .island_name').on('mouseout', function(){
      mapImage.src = images[8];
    });
  }
});
