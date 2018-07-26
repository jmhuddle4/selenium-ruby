class BasePage
  require 'selenium-webdriver'

  def initialize
    @driver = start_driver
    @base_url = 'https://mailchimp.com/'
  end

  def click(selector)
    @driver.find_element(:css, selector).click
  end

  def click_element_at_index(index, selector)
    @driver.find_elements(:css, selector)[index].click
  end

  def element_is_displayed(selector)
    @driver.find_element(:css, selector).displayed?
  end

  def fetch_text(selector)
    @driver.find_element(:css, selector).text
  end

  def fetch_text_at_index(index, selector)
    @driver.find_elements(:css, selector)[index].text
  end

  def fetch_size_of_list(selector)
    @driver.find_elements(:css, selector).size
  end

  def navigate_to_page(page)
    @driver.navigate.to @base_url + page
    puts @driver.title
  end

  # edit file_path to point to your chrome driver
  def start_driver
    file_path = 'C://Selenium/chromedriver'
    folder = 'chromedriver'
    web_driver = 'chromedriver.exe'
    file = File.absolute_path('', File.dirname(file_path)), folder, web_driver
    chrome_driver_path = File.join(file)
    Selenium::WebDriver::Chrome.driver_path = chrome_driver_path
    Selenium::WebDriver.for :chrome
  end

  def stop_driver
    @driver.quit
  end

  def wait_for_seconds(seconds)
    sleep(seconds)
  end

end