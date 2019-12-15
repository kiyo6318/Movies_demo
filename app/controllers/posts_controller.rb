class PostsController < ApplicationController
  before_action :set_movie
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to movie_post_path(@movie.movie_id,@post.id)
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def set_movie
    @movie = Movie.find_by!(movie_id: params[:movie_movie_id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :movie_id)
  end
end