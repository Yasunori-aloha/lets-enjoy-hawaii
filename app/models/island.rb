# frozen_string_literal: true

class Island < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ハワイ島', search: 'hawaii' },
    { id: 2, name: 'マウイ島', search: 'maui' },
    { id: 3, name: 'カホオラウェ島', search: 'kahoolawe' },
    { id: 4, name: 'ラナイ島', search: 'lanai' },
    { id: 5, name: 'モロカイ島', search: 'molokai' },
    { id: 6, name: 'オアフ島', search: 'oahu' },
    { id: 7, name: 'カウアイ島', search: 'kauai' },
    { id: 8, name: 'ニイハウ島', search: 'niihau' }
  ]
end
