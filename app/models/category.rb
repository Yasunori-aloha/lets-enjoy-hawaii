class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ホテル・コンドミニアム', search: 'hotel' },
    { id: 2, name: '食事', search: 'dinner' },
    { id: 3, name: 'レンタカー', search: 'rentacar' },
    { id: 4, name: '遊び・体験', search: 'leisure' },
    { id: 5, name: '観光地', search: 'landmark' },
    { id: 6, name: 'ショッピング', search: 'shopping'}
  ]
end
