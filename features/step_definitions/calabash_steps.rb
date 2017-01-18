require 'calabash-android/calabash_steps'

When(/^I am on Home Screen$/) do
  @home=page(HomeScreen).await
end

When(/^I go to "(.*?)" screen$/)do |arg|
  @home.go_to(arg)
end

Then(/^I can see the "(.*?)" screen loaded$/) do |arg|
  case arg
    when "Catch Up"
      page(CatchUpScreen).await.check_page_loaded
    when "Sky Box Sets"
      @skyboxset=page(SkyBoxSetsScreen).await.check_page_loaded
    when "Kids"
      page(KidsScreen).await.check_page_loaded
    when "Sports"
      page(SportsScreen).await.check_page_loaded
    when "On Now"
      page(OnNow).await.check_page_loaded
    when "Downloads"
      page(Downloads).await
  end
end

When(/^I open the downloads notification$/) do
  @common.open_notification_shutter
end

When(/^I tap the download notification$/) do
  @common.tap_notification("//node[@text='USB for charging']")
end

When(/^I tap on an program$/) do
  page(SkyBoxSetsScreen).select_random_series
end


