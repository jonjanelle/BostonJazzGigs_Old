module ApplicationHelper
  def title_format(page_title="")
    base = "Boston Jazz Gigs"
    if page_title.empty?
      return base
    else
      return page_title + " | " + base
    end
  end

  #limit the string to maxLen characters.
  #Entire string displayed if it contains fewer
  #or equal to maxLen characters.
  def limitTextLen(str, maxLen)
    if str.length <= maxLen
      return str
    else
      return str[0, maxLen]+"..."
    end
  end

end
