
require 'appium_lib'
require 'selenium-webdriver'

module Config_File

  def self.appium_server_url
    'http://127.0.0.1:4723/' # Specify the Appium server URL here
  end

  def self.desired_capabilities
    {
      caps: {
        platformName: 'Android',
        deviceName: 'Pixel 7 API 35',
        automationName: 'UiAutomator2',
        app: '/Users/mariamendez//Downloads/ColorNote Notepad Notes_4.5.3_APKPure.apk',
        autoGrantPermissions: 'true',
      },
      appium_lib: {
        server_url: appium_server_url
      }
    }
  end

  def self.setup_driver
    @driver = Appium::Driver.new(desired_capabilities, true).start_driver
    @driver.manage.timeouts.implicit_wait = 10 # Default implicit wait
    @wait = Selenium::WebDriver::Wait.new(timeout: 25) # Explicit wait of 25 seconds
    @driver
  end

  def self.driver
    @driver ||= setup_driver
  end

  def self.wait
    @wait ||= Selenium::WebDriver::Wait.new(timeout: 25) # Ensure the wait is set up
  end

  def self.quit_driver
    @driver.quit if @driver
  end
end