class Kondate < ActiveHash::Base
  self.data = [
   { id: 1, name: '---' },
   { id: 2, name: '主菜' },
   { id: 3, name: '副菜' },
   { id: 4, name: '小皿' },
   { id: 5, name: 'スープ' },
   { id: 6, name: 'デザート' },
   { id: 7, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :recipes
end