module ApplicationHelper
  
  #完全なタイトルを返します
  def full_title(page_title = '')
    base_title = "Trawith App"
    if page_title.empty?
      @title = base_title
    else
      @title = page_title + " | " + base_title
    end
  end
  
end
