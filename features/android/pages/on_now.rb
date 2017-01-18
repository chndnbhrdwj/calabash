require_relative 'base_vod'

class OnNow < BaseLinear

  def trait
    "TextViewFont text:'All Channels' selected:'true'"
  end

  def check_page_loaded
    page_loaded?(channel_logo_images,
                 now_next_program_one_time,
                 now_next_program_two_time,
                 now_next_program_three_time,
                 now_next_program_one_title,
                 now_next_program_two_title,
                 now_next_program_three_title)
  end

  def logos_count
    elements_count(channel_logo_images)
  end

end