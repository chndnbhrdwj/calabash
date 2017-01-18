require_relative 'base_screen'

class Downloads < BaseScreen

  def trait
    "TextViewFont text:'Downloads' selected:'true'"
  end

  def download_top_text
    "ImageView id:'download_top_text'"
  end

  def download_bottom_text
    "ImageView id:'download_bottom_text'"
  end

  def download_list
    "ListView id:'epglist'"
  end

  def download_title(download_header)
    "* text:'#{download_header}' sibling RelativeLayout descendant * id:'download_title'"
  end

  def channel_name_for_title(title)
    "RelativeLayout * text:'#{title}' sibling * id:'broadcast_channel'"
  end

  def download_status_for_title(title)
    "RelativeLayout * text:'#{title}' sibling * id:'download_status'"
  end

  def delete_button_for_title(title)
    "RelativeLayout * text:'#{title}' sibling LinearLayout descendant * id:'button_delete'"
  end

  def watch_button_for_title(title)
    "RelativeLayout * text:'#{title}' sibling LinearLayout descendant * id:'button_watch'"
  end

  def pause_button_for_title(title)
    "RelativeLayout * text:'#{title}' sibling LinearLayout descendant * id:'button_pause'"
  end

  def resume_button_for_title(title)
    "RelativeLayout * text:'#{title}' sibling LinearLayout descendant * id:'button_resume'"
  end

  def downloads_empty?
  wait_for_element_present?("ImageView id:'download_top_text'")
  end

  def downloads_present?
    element_exists(download_list)
  end


end