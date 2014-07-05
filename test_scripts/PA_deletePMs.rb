current_directory = File.expand_path(File.dirname(__FILE__))
require current_directory + "/../test_helper"

class DeletePM < MiniTest::Test

  include Common::AuthenticationHelper
  include Common::UsersHelper

  def setup
    @test_data = Data.config.test_data
    @config = Data.config.setup
    
    @driver = Selenium::WebDriver.for @config["test_browser"].to_sym
    @driver.get(@config["envi"] + "/")
  end

  def teardown
    @driver.quit
  end
  
  def test_login
    login(@driver, @test_data["user_pa"] + 1.to_s, @test_data["user_password"])
    
    for i in 1..10
      delete_member(@driver, @test_data["user_mem"] + i.to_s)
    end

    logout(@driver)
  end
end