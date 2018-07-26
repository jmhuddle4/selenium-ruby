require_relative 'base_page'

class FooterModule

  def initialize(base_page)
    @base_page = base_page
  end

  def click_link(href)
    @base_page.click_link_text('.site-footer', href)
    @base_page.wait_for_seconds(5)
  end

end