class MarkdownService
  def render(text)
    Maruku.new(text).to_html
  end
end