require 'capybara/rspec'
require 'webdrivers'

feature 'Google test', type: :feature do

  Capybara.app_host = 'https://google.com'
  Capybara.run_server = false
  Capybara.default_driver = :selenium_chrome

  scenario 'Visit Google' do
    visit '/'
    expect(page.title).to have_content('Google')
    fill_in 'q', with: 'automated testing'
    find('body').send_keys :enter
    find(:xpath, ".//input[@name='btnK']").click
    expect(page).to have_content('automated testing')
    find(:xpath, ".//a[@href='https://smartbear.com/learn/automated-testing/what-is-automated-testing/']").click()
    expect(page).to have_content("What is Automated Testing?")
    Selenium::WebDriver::Wait.new(:timeout=>5)

  end
end