module ApplicationHelper
  def flash_class(level)
  case level&.to_sym
    when :notice then "alert alert-success"
    when :success then "alert alert-info"
    when :error then "alert alert-danger"
    when :alert then "alert alert-danger"
  end
end
end
