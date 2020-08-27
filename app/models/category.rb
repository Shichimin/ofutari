class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'グルメ' },
    { id: 3, name: '映画・舞台' },
    { id: 4, name: 'スポーツ・レジャー' },
    { id: 5, name: 'その他' }
  ]
end