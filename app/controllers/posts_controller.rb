class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page],
      per_page: Settings.posts.per_page)
  end

  def show
    @post = Post.find params[:id]
    @comments = @post.comments
  end
end
