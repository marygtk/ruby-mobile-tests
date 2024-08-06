# frozen_string_literal: true

require 'appium_lib'
require 'rspec'
require 'selenium-webdriver'
require_relative '../config/config_file'
require_relative '../page_objects/locators'

RSpec.describe 'Webviews automated scenarios' do

  before(:all) do
    @driver = Config_File.setup_driver
    @locators = Locators.new(@driver)
    @wait = Config_File.wait
  end

  after(:all) do
    @driver.quit
  end

  it 'WebViews - handle chrome links test switching contexts' do

    @driver.find_element(:id, 'com.socialnmobile.dictapps.notepad.color.note:id/step1_next').click
    @driver.find_element(:id, 'com.socialnmobile.dictapps.notepad.color.note:id/btn_start_skip').click
    @driver.find_element(:id, 'com.socialnmobile.dictapps.notepad.color.note:id/page_more').click
    target_item = @driver.find_element(:uiautomator, 'new UiSelector().text("Like us on Facebook")')
    expect(target_item.text).to eq("Like us on Facebook")
    target_item.click

    wait = Selenium::WebDriver::Wait.new(timeout: 30) # seconds
    wait.until { @driver.available_contexts.size > 1 }

    @driver.set_context(@driver.available_contexts[1])

    # Locate the element using a valid CSS selector
    facebook_item = @driver.find_element(:css, 'div[data-action-id="32745"]')

    # Perform actions on the located element
    facebook_item.click

  end

end


