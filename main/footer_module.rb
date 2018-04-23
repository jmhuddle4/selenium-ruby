require_relative 'base_page'

class FooterModule

  def initialize(base_page)
    @base_page = base_page
  end

  def click_about_mail_chimp
    @base_page.click('[href=/about]')
  end

end