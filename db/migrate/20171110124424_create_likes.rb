class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :user_id
    end
    create_table :posts_likes do |t|
      t.integer :post_id
      t.integer :like_id
    end
  end
end
