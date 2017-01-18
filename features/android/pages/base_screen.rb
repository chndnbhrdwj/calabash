require 'calabash-android/abase'

class BaseScreen < Calabash::ABase

  def settings_icon
    "ImageView id:'settings_menu'"
  end

  def search_icon
    "ImageView id:'search'"
  end

  def page_loaded?(*args)
    args.each do |arg|
      result=element_exists(arg)
      return result if result == false
    end
    true
  end

  def elements_count(element)
    puts query(element).count
  end

  def wait_for_element_present?(*args)
    args.each do |arg|
      result=wait_for_element_exists(arg, :timeout => 1)
      return result if result == false
      end
    true
  end



end