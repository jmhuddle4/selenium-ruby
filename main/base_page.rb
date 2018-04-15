class BasePage

  require "selenium-webdriver"

  def initialize
    @driver = get_driver
  end

  def navigate_to_page(page)

    @driver.navigate.to "https://mailchimp.com/" + page

    puts @driver.title

    @driver.quit

  end

  def get_driver
    chromedriver_path = File.join(File.absolute_path('', File.dirname("C://Selenium/chromedriver_237")),"chromedriver_237","chromedriver.exe")
    Selenium::WebDriver::Chrome.driver_path = chromedriver_path
    driver = Selenium::WebDriver.for :chrome
  end


end