current_directory = File.expand_path(File.dirname(__FILE__))
require current_directory + "/../test_helper"

class XXXXXX < Test::Unit::TestCase

  include Common::XXXXXX

  def setup
    @test_data = Data.config.test_data
    @config = Data.config.setup
    
    @driver = Selenium::WebDriver.for @config["test_browser"].to_sym
    @driver.get(@config["envi"] + "/")
  end

  def teardown
    @driver.quit
  end
  
  def XXXXXX
  
  end
end