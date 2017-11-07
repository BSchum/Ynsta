class CreatePosttag < ActiveRecord::Migration[5.1]
  def change
    rename_table :post_tag, :post_tags
  end
end
