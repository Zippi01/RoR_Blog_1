module ApplicationHelper
  def flash_class(level)
    case level&.to_sym
      when :notice then "alert alert-success"
      when :success then "alert alert-info"
      when :error then "alert alert-danger"
      when :alert then "alert alert-danger"
    end
  end

  def cookie_index
    cookies[:"actions"] == 5
  end

  def nested_comments(comments)
    comments.map do |comment, sub_comments|
      render(comment) + content_tag(:div, nested_comments(sub_comments), class: 'nested_comments')
    end.join.html_safe
  end
end
