
require 'appium_lib'
require 'rspec'
require 'selenium-webdriver'
require_relative '../config/config_file'


class Locators

  def initialize(driver)
    @driver = driver
    @wait = Config_File.wait

  end

  def accept_warning
    @driver.find_element(:id, 'android:id/button1').click
  end

  def open_menu
    @driver.find_element(:uiautomator, 'new UiSelector().description("Open drawer")').click
    menu_items = []
    menu_items <<  @driver.find_element(:uiautomator, "new UiSelector().text(\"Flows\").instance(1)")
    menu_items << @driver.find_element(:uiautomator, "new UiSelector().text(\"Community\").instance(1)")
    menu_items << @driver.find_element(:uiautomator, "new UiSelector().text(\"Reddit\").instance(1)")
    menu_items <<  @driver.find_element(:uiautomator, "new UiSelector().text(\"Forum\").instance(1)")
    menu_items <<  @driver.find_element(:uiautomator, "new UiSelector().text(\"Settings\")")
    menu_items << @driver.find_element(:uiautomator, "new UiSelector().text(\"Help & feedback\")")

    menu_items

  end

  def click_login_button
    @driver.find_element(:id, 'login_button_id').click # Replace with the actual ID or locator
  end

  def login(username, password)
    enter_username(username)
    enter_password(password)
    click_login_button
  end
end
