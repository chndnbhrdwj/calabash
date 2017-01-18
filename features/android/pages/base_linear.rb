require_relative 'base_screen'

class BaseLinear < BaseScreen

  def trait
    "HorizontalScrollView"
    "RecyclerView id:'now_next_later_list'"
  end

  def text_element(text)
    "RecyclerView LinearLayout TextViewFont id:'"+text+"'"
  end

  def channel_logo_images
    "RecyclerView LinearLayout ImageView id:'ChannelLogoImageButton'"
  end

  def now_next_program_one_time
    text_element "nownext_program_one_time"
  end

  def now_next_program_two_time
    text_element "nownext_program_two_time"
  end

  def now_next_program_three_time
    text_element "nownext_program_three_time"
  end

  def now_next_program_one_title
    text_element "nownext_program_one_title"
  end

  def now_next_program_two_title
    text_element "nownext_program_two_title"
  end

  def now_next_program_three_title
    text_element "nownext_program_three_title"
  end

end

