require_relative 'base_screen'

class SeriesScreen < BaseScreen

  def series_image
    "* id:'programme_image_frame'"
  end

  def channel_logo
    "* id:'channel_logo'"
  end

  def series_title
    "* id:'programme_title'"
  end

  def series_description
    "* id:'programme_description'"
  end

  def episodes_container
    "* id:'episodes_groups'"
  end

  def get_random_episode_title
    query("* id:'episodes_groups' RelativeLayout * id:'event_title'",:text).sample
  end

  def more_details_for_episode(episode)
    "* id:'episodes_groups' RelativeLayout * text:'#{episode}' sibling * id:'more_details'"
  end

  def watch_button_for_episode(episode)
    "* id:'episodes_groups' RelativeLayout * text:'#{episode}' sibling * id:'button_container' child * id:'button_watch'"
  end

  def download_button_for_episode(episode)
    "* id:'episodes_groups' RelativeLayout * text:'#{episode}' sibling * id:'button_container' child * id:'button_download'"
  end

  def check_page_loaded?
    page_loaded?(series_image,
                 series_title,
                 channel_logo,
                 series_description,
                 episodes_container)
  end


end