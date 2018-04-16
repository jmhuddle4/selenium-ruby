class BasePage
  require 'selenium-webdriver'

  def initialize
    @driver = start_driver
  end

  def element_is_displayed(selector)
    @driver.find_element(:class, selector).displayed?
  end

  def fetch_text_at_index(index, selector)
    @driver.find_elements(:css, selector)[index].text
  end

  def fetch_size_of_list(selector)
    @driver.find_elements(:css, selector).size
  end

  def navigate_to_page(page)
    @driver.navigate.to 'https://mailchimp.com/' + page
    puts @driver.title
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

  def wait_for_element(selector)
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until { @driver.find_element(class: selector) }
  end

  def stop
    @driver.quit
  end
end