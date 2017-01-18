require_relative 'base_screen'

class HomeScreen < BaseScreen

  def trait
    "android.widget.HorizontalScrollView"
    "ViewPager id:'HOME_WELCOME_VIEWPAGER_ID'"
  end

  def carousel
    "ViewPager id:'HOME_WELCOME_VIEWPAGER_ID'"
  end

  def carousel_program_title
    "ViewPager TextViewFont id:'item_label'"
  end

  def carousel_program_channel
    "ViewPager TextViewFont id:'item_subtext'"
  end

  def featured_program_title
    "TextViewFont text:'Featured' sibling FrameLayout descendant RippleImageView sibling TextViewFont id:'grid_item_label'"
  end

  def go_to(screen)
    array=["Sky Movies","Kids","On Now","Downloads"]
    if array.include?(screen)
      sleep 1
      pan "HorizontalScrollView", :left
    end
    touch("TextViewFont marked:'"+screen+"'")
  end

  def visit_settings_menu
    touch settings_icon
  end

  def visit_search_screen
    touch search_icon
  end

end