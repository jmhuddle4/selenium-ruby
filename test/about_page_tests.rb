class AboutPageTests
  require_relative '../main/about_page'
  require_relative '../main/base_page'
  require_relative '../main/home_page'
  require 'cucumber'
  require 'csv'
  require 'assert'
  require 'require_all'

  # start driver with the base page
  base_page = BasePage.new
  
  #declare page objects
  @about_page = AboutPage.new(base_page)
  #@footer_module = FooterModule.new(base_page)
  @home_page = HomePage.new(base_page)

  Given(/^A user navigates to the MailChimp home page$/) do
    # verify navigation to home page
    @home_page.navigate_to_home_page
    assert_block 'did not navigate to home page' do
      @home_page.home_page_title_displays
    end
  end

  When /^The user clicks on "(.*?)"$/ do |link|
    #@footer_module.click_about_mail_chimp
  end
  
  Then /^The user should land on the about page$/ do
    # verify about page navigation
    @about_page.navigate_to_about_page
  end
  
  And /^The user should see the leadership team section$/ do
    assert @about_page.staff_section_displays
  end

  And /^The user should be able to see each team member's information$/ do
    # get number of team member cards
    num_team_members = @about_page.fetch_num_team_members
  
    # create/overwrite csv file with all team member names, titles & descriptions
    CSV.open('team_memembers.csv', 'wb') do |csv|
      csv << ['Name', 'Title', 'Description']
  
      for counter in 0..num_team_members - 1
        @about_page.click_team_member(counter)
        name = @about_page.fetch_member_name
        title = @about_page.fetch_member_title
        description = @about_page.fetch_member_description
  
        puts 'name: ' + name
        puts 'title: ' + title
        puts 'desc: ' + description
  
        csv << [name, title, description]
  
        @about_page.close_bio_view
      end
  
    end
  end

  # stop driver
  base_page.stop_driver

end