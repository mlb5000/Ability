# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(title)
    content_for(:title) { title }
  end

  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end

  def stylesheet(*files)
    content_for(:head) { stylesheet_link_tag(*files) }
  end

  def addheaderhable(url, title)
      output = "<table class='addHeader'>\n"
      output << "<tr>\n"
      output << "<td align='right'>\n"
      output << "<a href='" + url + "'>\n"
      output << "<img class='add' src='/images/add.png' title='" + title + "'>\n"
      output << "</a>\n"
      output << "</td>\n"
      output << "</tr>\n"
      output << "</table>\n"
      concat output
  end
end
