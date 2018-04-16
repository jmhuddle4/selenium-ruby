class AboutPageTests
  require_relative '../main/about_page'
  require_relative '../main/base_page'
  require_relative '../main/home_page'
  require 'csv'
  require 'test/unit'
  extend Test::Unit::Assertions

  # start driver with the base page
  base_page = BasePage.new

  # verify navigation to home page
  home_page = HomePage.new(base_page)
  home_page.navigate_to_home_page
  assert home_page.home_page_title_displays

  # verify about page navigation
  about_page = AboutPage.new(base_page)
  about_page.navigate_to_about_page
  assert about_page.staff_section_displays

  # get number of team member cards
  num_team_members = about_page.fetch_num_team_members

  # create/overwrite csv file with all team member names, titles & descriptions
  CSV.open('team_memembers.csv', 'wb') do |csv|
    csv << ['Name', 'Title', 'Description']

    for counter in 0..num_team_members - 1
      about_page.click_team_member(counter)
      name = about_page.fetch_member_name
      title = about_page.fetch_member_title
      description = about_page.fetch_member_description

      puts 'name: ' + name
      puts 'title: ' + title
      puts 'desc: ' + description

      csv << [name, title, description]

      about_page.close_bio_view
    end

  end

  # stop driver
  base_page.stop_driver

end