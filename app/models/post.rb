class Post < ApplicationRecord
    mount_uploader :picture, PictureUploader
    belongs_to :user
    belongs_to :category
    has_many :post_tags
    has_many :tags, through: :post_tags

    def self.search(args,offset)
      if args[:category_id] 
        Post.where("category LIKE :query AND id > :offset", query: "#{args[category_id]}", offset:"#{offset}")
      elsif args[:tag_id]
        Post.where("tag LIKE :query AND id > :offset", query: "#{args[tag_id]}",offset:"#{offset}")
      else
        Post.where("id > :offset",offset:"#{offset}")
      end
    end
end
