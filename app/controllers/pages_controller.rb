class PagesController < ApplicationController
  def home
    @posts = Post.all[-5..-1].reverse
    @user = User.find(current_user)
  end

  def help
  end

  def about
  end

  def contact
  end
end
