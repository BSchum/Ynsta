class CreatePostTag < ActiveRecord::Migration[5.1]
  def change
    create_table :post_tag do |t|
      t.integer :post_id
      t.integer :tag_id
    end
  end
end
