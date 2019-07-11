  require_relative '../pages/about_page'
  require_relative '../pages/base_page'
  require_relative '../pages/home_page'
  require 'capybara'
  require 'capybara/cucumber'
  require 'csv'
  require 'test-unit'
  require 'require_all'
  require 'test/unit/assertions'

  Given (/^A user navigates to the MailChimp home page$/) do
    # start driver with the base page
    @base_page = BasePage.new

    #declare page objects
    @about_page = AboutPage.new(@base_page)
    @footer_module = FooterModule.new(@base_page)
    @home_page = HomePage.new(@base_page)

    # verify navigation to home page
    @home_page.navigate_to_home_page
    expect(@base_page.get_title).to eq 'Marketing Platform for Small Businesses - Sell More Stuff | MailChimp'
  end

  When (/^The user navigates to the "(.*?)" page$/) do |page|
    @base_page.navigate_to_page(page)
  end
  
  Then (/^The user should land on the about page$/) do
    expect(@base_page.get_title).to eq 'About MailChimp Culture and Community'
  end
  
  And (/^The user should see the leadership team section$/) do
    expect(@about_page.staff_section_displays)
  end

  And (/^The user should be able to see each team member's information$/) do
    # get number of team member cards
    num_team_members = @about_page.fetch_num_team_members
  
    # create/overwrite csv file with all team member names, titles & descriptions
    CSV.open('team_members.csv', 'wb') do |csv|
      csv << ['Name', 'Title', 'Description']
  
      for counter in 0..num_team_members - 1
        @about_page.click_team_member(counter)
        name = @about_page.fetch_member_name
        title = @about_page.fetch_member_title
        description = @about_page.fetch_member_description
  
        csv << [name, title, description]
  
        @about_page.close_bio_view
      end
  
    end

    # stop driver
    @base_page.stop_driver
  end