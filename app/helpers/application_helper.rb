module ApplicationHelper
  def title_format(page_title="")
    base = "Boston Jazz Gigs"
    if page_title.empty?
      return base
    else
      return page_title + " | " + base
    end
  end
end
