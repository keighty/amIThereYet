class CommentsController < ApplicationController
  before_action :set_user
  # before_action :signed_in_user, only: [:create]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save

    respond_to do |format|
      format.js
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end

    def set_user
      @user = current_user
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

end
