class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  def index
    @blogs = Blog.all
    
    @q = Blog.ransack(params[:q])
    @blogs = @q.result(distinct: true)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: 'ブログを作成しました'
    else
      render :new
    end
  end

  def edit
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
    if @blog.destroy
      redirect_to blogs_path, notice: 'ブログを削除しました'
    else
      render
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content, :image)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
