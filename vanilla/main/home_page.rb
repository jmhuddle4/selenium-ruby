require_relative 'base_page'

class HomePage

  def initialize(base_page)
    @base_page = base_page
  end

  def navigate_to_home_page
    @base_page.navigate_to_page('')
  end

  def home_page_title_displays
    @base_page.element_is_displayed('.super_title')
  end

end