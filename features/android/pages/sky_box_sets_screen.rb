require_relative 'base_vod'

class SkyBoxSetsScreen < BaseVOD

  def trait
    "TextViewFont text:'US Collection'"
  end

  def check_page_loaded
    page_loaded?(images,
                 program_name,
                 channel_name)
  end

  def select_random_series
    puts get_random_series
    touch get_random_series
  end

end