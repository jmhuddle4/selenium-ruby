class AboutPage

  require_relative 'base_page'

  def initialize
   @base_page = BasePage.new
  end

  def fetch_staff_name(index)
    @base_page.fetch_text_at_index(index, '.bio_wrapper h3')
  end

  def fetch_staff_title(index)
    @base_page.fetch_text_at_index(index, '.bio_wrapper span')
  end

  def fetch_staff_size
    @base_page.fetch_size_of_list('.bio_wrapper img')
  end

  def navigate_to_page
    @base_page.navigate_to_page('about')
  end

  def staff_section_displays
    @base_page.element_is_displayed('bio_wrapper')
  end

  def stop
    @base_page.stop
  end

end