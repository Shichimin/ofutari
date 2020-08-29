class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # ActiveHashのアソシエーション
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
 
  belongs_to :user
  has_many :comments

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :title
    validates :category_id
    validates :prefecture_id
  end

  # 各項目の選択が「--」のときは保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :prefecture_id
  end
end
