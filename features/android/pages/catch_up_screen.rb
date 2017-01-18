require_relative 'base_vod'

class CatchUpScreen < BaseVOD

  def trait
    "TextViewFont text:'Sky Channels'"
  end

  def check_page_loaded
    page_loaded?(images,
                 program_name,
                 channel_name)
  end
end