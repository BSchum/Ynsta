class CreateTablePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.timestamps
      t.text :description
      t.string :picture
      t.integer :user_id
      t.integer :category_id
      t.integer :tag_id
    end
  end
end
