require 'test_helper'

describe User do

  before do
    @user = users(:user)
  end

  it "returns full name" do
    assert_equal"John Snow", @user.fullname
  end

  it "returns slug" do
    assert_equal"123-John", @user.slug
  end

  it "returns number like for post" do
    posts = Post.search(slug: "123-John")
    post = posts.first
    assert_equal 0, @user.numberLike(post)
  end

end
