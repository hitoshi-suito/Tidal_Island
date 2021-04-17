class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  def index
    @tide = Tide.insert_column
    if @tide.low_start_at < @tide.current_time && @tide.current_time < @tide.low_end_at
      @blogs = Blog.all
    else
      redirect_to tides_path
    end

    @q = Blog.ransack(params[:q])
    @blogs = @q.result(distinct: true)
  end

  def new
    @blog = Blog.new
  end

  def create
    @tide = Tide.insert_column
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
