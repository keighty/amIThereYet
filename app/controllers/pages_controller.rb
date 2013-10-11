class PagesController < ApplicationController
  def home
    if signed_in?
      @posts = Post.all[-5..-1].reverse
      @user = User.find(current_user)
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
