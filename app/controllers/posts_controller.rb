class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page],
                           per_page: Settings.posts.per_page)
  end
end
