class CommentsController < ApplicationController
  before_action :set_blog, only: [:create, :edit, :update, :destroy]
  
  def create
    @comment = @blog.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to blog_path(@blog.id), notice: '投稿できませんでした' }
      end
    end
  end

  def edit
    @comment = @blog.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @comment = @blog.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        flash.now[:notice] = 'コメントが編集されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの編集ができませんでした'
        format.js { render :edit_error}
      end
    end
  end

  def destroy
    @comment = @blog.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントを削除しました'
      format.js { render :index }
    end 
  end


  private
  def comment_params
    params.require(:comment).permit(:blog_id, :content)
  end

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end
end
