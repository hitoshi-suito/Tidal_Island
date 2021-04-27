class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :check_tide, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  def index
    @tide = Tide.find_closest
    @blogs = @tide.blogs
    @q = @tide.blogs.ransack(params[:q])
    @blogs = @q.result(distinct: true)

    redirect_to tides_path unless (user_signed_in? && current_user.admin == true) || @tide.opening?
  end

  def new
    @blog = Blog.new
  end

  def create
    @tide = Tide.find_closest
    @blog = current_user.blogs.build(blog_params)
    @blog.tide_id = @tide.id
    if @blog.save
      redirect_to blogs_path, notice: 'ブログを作成しました'
    else
      render :new
    end
  end

  def edit
    if @blog.user_id != current_user.id
      redirect_to blogs_path, notice: '投稿したユーザのみ編集できます'
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: 'ブログを更新しました'
    else
      render :edit
    end
  end

  def show
    @comments = @blog.comments
    @comment = @blog.comments.build
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: 'ブログを削除しました'
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content, :image)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def check_tide
    if user_signed_in?
      redirect_to tides_path, notice: 'ブログは削除されました' unless @blog.tide.opening? || current_user.admin == true
    else
      redirect_to tides_path, notice: 'ブログは削除されました' unless @blog.tide.opening?
    end
  end
end
