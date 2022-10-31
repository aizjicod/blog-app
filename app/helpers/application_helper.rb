module ApplicationHelper
  def comments?(comments)
    return true if comments.length.positive?
  end
end
