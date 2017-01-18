require 'nokogiri'

class Common

  def go_offline
    toggle_network(1, true) if `adb shell settings get global airplane_mode_on`.to_i == 0
  end

  def go_online
     toggle_network(0, false) if `adb shell settings get global airplane_mode_on`.to_i == 1
  end

  def toggle_network(mode, state)
    `adb shell settings put global airplane_mode_on #{mode.to_i}`
    `adb shell am broadcast -a android.intent.action.AIRPLANE_MODE --ez state #{state}`
  end

  def open_notification_drawer
    `adb shell input swipe 0 3 0 2000`
  end

  def close_notification_drawer
    `adb shell input swipe 0 2300 0 3`
  end

  def exec_adb(command)
    `adb #{command}`
  end

  def uiautomator_dump
    stdout, stderr, status = exec_adb('shell uiautomator dump')
    unless /dumped to: (?<file>\S*)/ =~ stdout
      fail "uiautomator dump failed? Returned #{stdout} :: #{stderr}"
    end
    stdout, stderr, status = exec_adb("shell cat #{file}")
    [stdout, stderr, status]
  end

  def xpath_for_full_path_texts(params)
    texts = params.keys.grep(/^notification.full./)
    clauses = texts.collect { |k| "./node/node[@text='#{params[k]}']" }
    "//node[#{clauses.join('][')}]"
  end

  def extract_integer_bounds(set)
    return nil if set.empty?
    match = (set.attr('bounds').to_s.match(/\[(\d+),(\d+)\]\[(\d+),(\d+)\]/))
    match.captures.collect(&:to_i)
  end

  def bounds_from_xpath(xpath)
    stdout, _stderr, _status = uiautomator_dump
    set = Nokogiri::XML(stdout).xpath(xpath)
    if (bounds = extract_integer_bounds(set))
      return yield bounds
    else
      return nil
    end
  end

  def open_notification_shutter
    bounds_from_xpath('//node[1]') do |x1, y1, x2, y2|
      xm = (x1 + x2) >> 1
      exec_adb("shell input swipe #{xm} #{y1} #{xm} #{y2}")
    end
  end

  def tap_notification(xpath)
    found_bounds = bounds_from_xpath(xpath) do |x1, y1, x2, y2|
      ym = (y1 + y2) >> 1
      exec_adb("shell input tap #{(x1 + x2) >> 1} #{ym}")
    end
    dismissed = !found_bounds.nil?
    exec_adb("shell input keyevent 4") unless dismissed
    return dismissed
  end

  def dismiss_notification(xpath)
    found_bounds = bounds_from_xpath(xpath) do |x1, y1, _x2, y2|
      ym = (y1 + y2) >> 1
      exec_adb("shell input swipe #{x1} #{ym} 10000 #{ym}")
    end
    found_bounds.nil?
  end

end
