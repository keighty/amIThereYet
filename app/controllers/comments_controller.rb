class CommentsController < ApplicationController
  before_action :set_user
  before_action :set_post
  before_action :set_comment, only: [:destroy, :edit, :update]
  before_action :signed_in_user, only: [:create]

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    respond_to :js
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    store_location
    if @comment.update(comment_params)
      respond_to do |format|
        format.html { redirect_to @post }
        format.js
      end
    else
      flash[:error] = "Comment Not Updated"
      redirect_to @post
    end
  end

  # DELETE /post/1/comment/10
  def destroy
    if @comment.destroy
      respond_to do |format|
        format.html {redirect_to @user}
        format.js
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end

    def set_user
      @user = current_user
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    def signed_in_user
      unless signed_in?
        session[:return_to] = post_path(@post)
        redirect_to signin_url, notice: "Please sign in."
      end
    end
end
