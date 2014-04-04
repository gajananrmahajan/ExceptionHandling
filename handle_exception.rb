require 'selenium-webdriver'
require 'rspec-expectations'

def setup
	@driver = Selenium::WebDriver.for :firefox
	@driver.get "http://www.google.com"
end

def teardown
	@driver.quit
end

def run
	setup
	yield
	teardown
end

def rescue_exceptions
	begin
		yield
		return true
	rescue Selenium::WebDriver::Error::NoSuchElementError
		return false
	end
end

run do
	rescue_exceptions { @driver.find_element(:id, "Gajanan")}.should == false
end
