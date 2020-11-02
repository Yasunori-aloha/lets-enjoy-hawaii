'use strict';


$(function(){
  let mapImage = $('#map_image')[0];
  {
    // オアフ島をホバーしている間、オアフ島の表示色を変更する。
    $('#map_oahu').on('mouseover', function(){
      mapImage.src = 'assets/hawaiian_islands_oahu.png'
    });
    $('#map_oahu').on('mouseout', function(){
      mapImage.src = 'assets/hawaiian_islands.png'
    });
    $('#map_niihau').on('mouseover', function(){
      mapImage.src = 'assets/hawaiian_islands_niihau.png'
    });
    $('#map_niihau').on('mouseout', function(){
      mapImage.src = 'assets/hawaiian_islands.png'
    });
    $('#map_kahoolawe').on('mouseover', function(){
      mapImage.src = 'assets/hawaiian_islands_kahoolawe.png'
    });
    $('#map_kahoolawe').on('mouseout', function(){
      mapImage.src = 'assets/hawaiian_islands.png'
    });
    $('#map_lanai').on('mouseover', function(){
      mapImage.src = 'assets/hawaiian_islands_lanai.png'
    });
    $('#map_lanai').on('mouseout', function(){
      mapImage.src = 'assets/hawaiian_islands.png'
    });
    $('#map_molokai').on('mouseover', function(){
      mapImage.src = 'assets/hawaiian_islands_molokai.png'
    });
    $('#map_molokai').on('mouseout', function(){
      mapImage.src = 'assets/hawaiian_islands.png'
    });
    $('#map_kauai').on('mouseover', function(){
      mapImage.src = 'assets/hawaiian_islands_kauai.png'
    });
    $('#map_kauai').on('mouseout', function(){
      mapImage.src = 'assets/hawaiian_islands.png'
    });
    $('#map_hawaii').on('mouseover', function(){
      mapImage.src = 'assets/hawaiian_islands_island_of_hawaii.png'
    });
    $('#map_hawaii').on('mouseout', function(){
      mapImage.src = 'assets/hawaiian_islands.png'
    });
    $('#map_maui').on('mouseover', function(){
      mapImage.src = 'assets/hawaiian_islands_maui.png'
    });
    $('#map_maui').on('mouseout', function(){
      mapImage.src = 'assets/hawaiian_islands.png'
    });
  }
});