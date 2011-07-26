module ApplicationHelper
  def link_to_author(author, *args)
    link_to(author, author, *args)
  end
end
