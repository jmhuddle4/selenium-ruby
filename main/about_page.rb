class AboutPage

  require_relative 'base_page'

  def navigate_to_page
    bp = BasePage.new
    bp.navigate_to_page("about")
  end

end