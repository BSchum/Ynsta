require 'test_helper'

describe Post do

  it "returns post by category if keyword is category_id" do
    posts = Post.search(category_id: 2)
    assert_equal 1, posts.length
    assert_equal "description 2", posts.first.description
  end

  it "returns post by slug if keyword is slug" do
    posts = Post.search(slug: "123-John")
    assert_equal 1, posts.length
    assert_equal "test", posts.first.description
  end

  it "returns post by tag if keyword is tag_id" do
    posts = Post.search(tag_id: 1)
    assert_equal 1, posts.length
    assert_equal "happy", posts.first.tags.first.name
  end

  it "returns post by search if keyword is string" do
    posts = Post.search(string: "test")
    assert_equal 1, posts.length
    assert_equal "test", posts.first.description
  end

  it "returns all posts if keyword doesn't exist" do
    posts = Post.search(nothing: "not")
    assert_equal 3, posts.length
  end

end
