class CommentsController < ApplicationController
  before_action :set_user
  before_action :set_post
  before_action :signed_in_user, only: [:create]

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    respond_to :js
  end

  def delete

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

    def signed_in_user
      unless signed_in?
        session[:return_to] = post_path(@post)
        redirect_to signin_url, notice: "Please sign in."
      end
    end

end
