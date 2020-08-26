class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string     :title,       null: false, default: ""
      t.text       :description, null: false
      t.integer    :category,    null: false, default: 2
      t.integer    :prefecture,  null: false, default: 2
      t.text       :url,         null: false
      t.references :user,        null: false
      t.timestamps
    end
  end
end
