'use strict';

$(function(){
  $('[id^="review_score_"]').on('click', function(){
    console.log($(this)[0].innerText);
  });
  $('[id^="star_btn"]').on('mouseover', function(){
    console.log($(this));
  });
});