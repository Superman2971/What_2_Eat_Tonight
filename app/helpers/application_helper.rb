module ApplicationHelper

  def page_title(page_title)
    base_title = "Testing: "
    if page_title.empty?
      "No Page Title!"
    else
      "#{base_title}#{page_title}"
    end
  end

end