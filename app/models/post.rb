class Post < ActiveRecord::Base
  validates_presence_of :title, :body

  has_many :comments

  def content
    MarkdownService.new.render(body)
  end
end
