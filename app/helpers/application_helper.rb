module ApplicationHelper
  def flash_message(type, text, now = false)
    if now
      flash.now[type] ||= []
      flash.now[type] << text
    else
      flash[type] ||= []
      flash[type] << text
    end
  end
end
