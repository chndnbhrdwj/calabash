require_relative 'base_vod'

class KidsScreen < BaseVOD

  def trait
    "TextViewFont text:'Cartoon Network'"
  end

  def check_page_loaded
    page_loaded?(images,
                 program_name,
                 channel_name)
  end

end