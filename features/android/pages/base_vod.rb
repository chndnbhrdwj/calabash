require_relative 'base_screen'

class BaseVOD < BaseScreen

  def trait
    "HorizontalScrollView"
    "ListView id:'epglist'"
  end

  def images
    "ListView LinearLayout RippleImageView"
  end

  def program_name
    "RippleImageView sibling LinearLayout child TextViewFont id:'event_title'"
  end

  def channel_name
    "RippleImageView sibling LinearLayout child TextViewFont id:'event_subtitle'"
  end

  def random_title
    query("* id:'epglist' * id:'svod_root' * id:'event_title'",:text).sample
  end

  def get_random_series
    program_name
    begin
      program=query(program_name,:text).sample
    end until program.include?("Series") | program.include?("Season")
    return program
  end

end

