# selenium-ruby
## An example test suite that uses selenium with ruby

- IDE I used: JetBrains RubyMine
- Ruby SDK (Windows): ruby-2.4.4-p296 from https://rubyinstaller.org/downloads/
- Ruby development (Mac): rbenv https://github.com/rbenv/rbenv#installation
- WebDriver: https://chromedriver.storage.googleapis.com/index.html?path=2.40/

## MailChimp exercise

### To run a regular test
- go to the terminal & run `bundle install` to get all the gems or use `gem install bundler` if you are on mac
- make sure you have the chromedriver installed in the directory specified in base_page.rb
`C:\Selenium\chromedriver\chromedriver.exe` or `<User>\Documents\Selenium\chromedriver` if you are on a mac
- cd into the vanilla/test folder 
- run 'ruby about_page_test.rb'

### To run a cucumber test
- go to the terminal & run 'bundle install' to get all the gems
- make sure you have the chromedriver installed in the directory specified in base_page.rb
`C:\Selenium\chromedriver\chromedriver.exe` or `<User>\Documents\Selenium\chromedriver` if you are on a mac
- cd into the cucumber folder
- run command 'cucumber'

### Contact
jmhuddle4@gmail.com
