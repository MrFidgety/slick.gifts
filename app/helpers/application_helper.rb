module ApplicationHelper
  
  # Manage multiple flash messages
  def flash_message(type, text, now = false)
    if now
      flash.now[type] ||= []
      flash.now[type] << text
    else
      flash[type] ||= []
      flash[type] << text
    end
  end
  
  # Allow link_to_if to work with html blocks
  def link_to_if(*args,&block)
    args.insert 1, capture(&block) if block_given?
    super *args
  end
end
