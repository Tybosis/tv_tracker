module ApplicationHelper
  def flash_class(level)
    level == :notice ? "info" : level.to_s
  end
end
