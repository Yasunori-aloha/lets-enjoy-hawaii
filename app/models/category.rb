class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ホテル・コンドミニアム' },
    { id: 2, name: '食事' },
    { id: 3, name: 'レンタカー' },
    { id: 4, name: '遊び・体験' },
    { id: 5, name: '観光地' },
    { id: 6, name: 'ショッピング' }
  ]
end
