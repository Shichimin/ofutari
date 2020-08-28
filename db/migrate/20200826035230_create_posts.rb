class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string     :title,         null: false, default: ""
      t.text       :description,   null: false
      t.integer    :category_id,   null: false
      t.integer    :prefecture_id, null: false
      t.text       :url,           null: false
      t.references :user,          null: false
      t.timestamps
    end
  end
end
