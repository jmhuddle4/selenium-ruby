require_relative 'base_page'

class AboutPage

  def initialize(base_page)
    @base_page = base_page
  end

  def click_team_member(index)
    @base_page.wait_for_seconds(0.5)
    @base_page.click_element_at_index(index, '.bio_link')
  end

  def close_bio_view
    @base_page.wait_for_seconds(0.5)
    @base_page.click('#bio_view .close_btn')
  end

  def fetch_member_description
    @base_page.fetch_text('#bio_view .col.span3of5')
  end

  def fetch_member_name
    @base_page.fetch_text('#bio_view h3')
  end

  def fetch_member_title
    @base_page.fetch_text('#bio_view .span3of5 span')
  end

  def fetch_num_team_members
    @base_page.fetch_size_of_list('.bio_wrapper h3')
  end

  def navigate_to_about_page
    @base_page.navigate_to_page('about')
  end

  def staff_section_displays
    @base_page.element_is_displayed('.bio_wrapper')
  end

end