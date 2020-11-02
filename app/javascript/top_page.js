'use strict';

$(function(){
  // 地図画像を表示しているimageタグを取得。
  const mapImage = $('#map_image')[0];
  // 地図の表示で使用する画像を配列で変数に保存。
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
    // カーソルが要素に乗ったら、乗った要素の'data-id'で判別して対応した地図を表示させる。
    $('map').on('mouseover', function(){
      const hoverId = $(':hover')[7].dataset.id;
      mapImage.src = images[hoverId];
    });
    // カーソルが要素から外れたら、地図表示を元に戻す。
    $('map').on('mouseout', function(){
      mapImage.src = images[8];
    });
  }
});