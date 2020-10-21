class Score < ActiveHash::Base
  self.data = [
    { id: 1, name: '------------'},
    { id: 2, name: '★1.0以上'},
    { id: 3, name: '★2.0以上'},
    { id: 4, name: '★3.0以上'},
    { id: 5, name: '★4.0以上'}
  ]
end
