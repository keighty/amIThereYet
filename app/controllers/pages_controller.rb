class PagesController < ApplicationController
  def home
    @posts = Post.all[-5..-1].reverse
  end

  def help
  end

  def about
  end

  def contact
  end
end
