class Post < ApplicationRecord
    mount_uploader :picture, PictureUploader
    acts_as_votable
    belongs_to :user
    belongs_to :category
    has_many :post_tags
    has_many :tags, through: :post_tags

    def self.search(args,uri)
      if args[:category_id] 
        out = Post.where(["category_id = ?", args[:category_id]])
      elsif args[:tag_id]
        out = Post.joins(:post_tags).where(["post_tags.tag_id = ?", args[:tag_id]])      
      elsif args[:slug]
        out = Post.where(["user_id = ?", args[:slug].to_i])
      elsif args[:string]
        out = Post.joins(:user, :category).where(["description LIKE ? 
                                                   OR users.firstname LIKE ?
                                                   OR users.lastname  LIKE ?",
                                                   "%#{args[:string]}%",
                                                   "%#{args[:string]}%",
                                                   "%#{args[:string]}%"])
      else
        out = Post.all
      end
      if args[:offset]
        out.limit(12).offset(args[:offset])
      else
        out.limit(12)
      end
    end
    

end
