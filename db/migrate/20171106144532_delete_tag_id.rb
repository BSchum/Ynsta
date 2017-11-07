class DeleteTagId < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :tag_id 
  end
end
