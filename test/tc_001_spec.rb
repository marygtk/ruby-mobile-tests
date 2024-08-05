require 'appium_lib'
require 'rspec'
require 'selenium-webdriver'
require_relative '../config/config_file'
require_relative '../page_objects/locators'

RSpec.describe 'Your Appium Tests' do

  before(:all) do
    @driver = Config_File.setup_driver
    @locators = Locators.new(@driver)
    @wait = Config_File.wait
  end

  after(:all) do
    @driver.quit
  end

  it 'executes your test method' do
    @locators.accept_warning
    menu_items = @locators.open_menu
    expect(menu_items[0].displayed?).to be true
    expect(menu_items[1].displayed?).to be true
    expect(menu_items[2].displayed?).to be true
    expect(menu_items[3].displayed?).to be true
    expect(menu_items[4].displayed?).to be true
    expect(menu_items[5].displayed?).to be true
  end

end


