class AboutPageTests
  require_relative '../main/about_page'
  require 'test/unit'
  extend Test::Unit::Assertions

  a = AboutPage.new
  a.navigate_to_page
  assert a.staff_section_displays

  num_staff_members = a.fetch_staff_size

  for counter in 0..num_staff_members - 1
    name = a.fetch_staff_name(counter)
    title = a.fetch_staff_title(counter)

    puts 'name: ' + name
    puts 'title: ' + title

  end

  a.stop

end