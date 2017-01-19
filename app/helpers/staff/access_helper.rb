module Staff::AccessHelper
    def menu_link(name, path, options={})
      string = "<li>"
      string +=  link_to(name, path,
                         { :onmouseover => "writeText('status', 'Manage #{name}');",
                          :onmouseout  => "writeText('status', '');"}.merge(options))
      string += "</li>"
      string.html_safe
  end

  def status_tag(boolean, options={})
      options[:true]        ||= ''
      options[:true_class]  ||= 'glyphicon glyphicon-ok'
      options[:false]       ||= ''
      options[:false_class] ||= 'glyphicon glyphicon-remove'

      if boolean
        content_tag(:span, options[:true], :class => options[:true_class])
      else
        content_tag(:span, options[:false], :class => options[:false_class])
      end
    end

    # Format text for display.
    def format(text)
      sanitize(markdown(text))
    end

    def cancel_button(link, options={})
      "<input type='button' value='Cancel' class='cancel-button #{options[:class]}' onclick=\"window.location.href='#{link}';\" />".html_safe
    end
end
