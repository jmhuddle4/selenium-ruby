class BasePage
  require 'selenium-webdriver'

  def initialize
    @driver = start_driver
  end

  def navigate_to_page(page)
    @driver.navigate.to 'https://mailchimp.com/' + page
    puts @driver.title
    @driver.quit
  end

  def start_driver
    file_name = 'C://Selenium/chromedriver_237'
    folder = 'chromedriver_237'
    web_driver = 'chromedriver.exe'
    file = File.absolute_path('', File.dirname(file_name)), folder, web_driver
    chrome_driver_path = File.join(file)
    Selenium::WebDriver::Chrome.driver_path = chrome_driver_path
    Selenium::WebDriver.for :chrome
  end
end