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
    output << "<img class='add' src='/images/add-icon24.png' title='" + title + "'>\n"
    output << "</a>\n"
    output << "</td>\n"
    output << "</tr>\n"
    output << "</table>\n"
    concat output
  end

  def editmodelbutton(url)
    output = "<a href=\"" + url + "\">\n"
    output << "<img src=\"/images/edit-icon.png\"/>\n"
    output << "</a>"
  end

  def deletemodelbutton(url)
     link_to image_tag("/images/close.png", :border=>0), url, :confirm => 'Are you sure?', :method => :delete
  end
end
