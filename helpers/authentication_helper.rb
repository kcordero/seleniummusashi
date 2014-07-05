module Common
  module AuthenticationHelper
 
 def login(driver, username="", password="", expect_entry=true)
      
      wait = Selenium::WebDriver::Wait.new(:timeout => 15)
      
      driver.find_element(:xpath, "//input[@type='text']").clear
      driver.find_element(:xpath, "//input[@type='text']").send_keys(username)
      driver.find_element(:xpath, "//input[@type='password']").clear
      driver.find_element(:xpath, "//input[@type='password']").send_keys(password)
      driver.find_element(:xpath, "//input[@value='Login']").click
      
      wait.until { driver.find_element(:id, "dash-mainbar") }
      # if expect_entry
      #  assert_equal((driver.find_element(:css, "#dash-mainbar > div > div.col-md-10 > ul.nav.navbar-nav.navbar-right > li:nth-child(2) > a").text == "Logout"), true)
      # end 
    end

  end
end