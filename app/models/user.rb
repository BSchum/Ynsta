class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  acts_as_voter

  def is_admin?
    true
  end

  def fullname
    "#{firstname} #{lastname}"
  end
  
  def slug
    "#{id}-#{firstname}"
  end

  def toggleLike(post_id)
    out = {post_id: post_id}
    post = Post.find(post_id)
    if voted_for? post
      unlike post
      out[:klass] = "inactive"
    else
      likes post
      out[:klass] = "active"
    end
      out[:number] = numberLike(post)

    return out
  end

  def numberLike(post)
    post.get_likes.size
 end
end
