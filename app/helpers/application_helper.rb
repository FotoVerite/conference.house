module ApplicationHelper

  def errors_for(object, object_name=nil)
    if object.errors.any?
        content_tag(:div, class: "panel panel-danger") do
            concat(content_tag(:div, class: "panel-heading") do
                concat(content_tag(:h4, class: "panel-title") do
                    concat "#{pluralize(object.errors.count, "error")} prohibited this #{object_name || object.class.name.downcase} from being saved:"
                end)
            end)
            concat(content_tag(:div, class: "panel-body") do
                concat(content_tag(:ul) do
                    object.errors.full_messages.each do |msg|
                        concat content_tag(:li, msg)
                    end
                end)
            end)
        end
    end
end

  # rubocop:disable Metrics/MethodLength
  def react_component(name, props)
    html = <<-eos
    <script>
    (function(){
      var name = #{name.to_json};
      var props = #{props.to_json};
      var node = document.createElement('div');
      node.setAttribute('data-reactComponent', name);

      var scripts = document.getElementsByTagName('script');
      var scriptTag = scripts[scripts.length-1];
      scriptTag.parentNode.insertBefore(node, scriptTag);

      window.reactComponents = window.reactComponents || [];
      window.reactComponents.push([name, props, node]);
    })();
    </script>
    eos
    html.html_safe
  end
  # rubocop:enable Metrics/MethodLength

    def bootstrap_class_for(flash_type)
    case flash_type
      when "success"
        "alert-success"   # Green
      when "error"
        "alert-danger"    # Red
      when "alert"
        "alert-warning"   # Yellow
      when "notice"
        "alert-info"      # Blue
      else
        flash_type.to_s
    end
  end

  def inline_error_message(object, attribute)
    "<span class='text-danger'><b>#{object.errors[attribute].join(', ') }</b></span>".html_safe
  end


end
