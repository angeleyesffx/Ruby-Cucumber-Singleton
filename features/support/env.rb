#encoding: utf-8

 require 'capybara/cucumber'
 require 'capybara/rspec'
 require 'selenium-webdriver'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :chrome

Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver        = :selenium
end


#coding: utf-8
 require 'capybara/cucumber'
 require 'capybara-screenshot/cucumber'
 require 'capybara/rspec'
 require 'capybara-screenshot/rspec'
 require 'selenium-webdriver'
 require 'yaml'

 ENV['TEST_ENV'] ||= 'homolog'
 ENV['DATA_POOL'] ||= 'DATA_ACCESS'
 BASE_URL = YAML.load_file(File.dirname(__FILE__) + "/config.yml")[ENV['TEST_ENV']]["url"]

    Capybara.register_driver :selenium_proxy do |app|
        #In this case selenium is using a proxy configuration with Chrome browser
        options = Selenium::WebDriver::Chrome::Options.new(args: ['start-maximized', 'spobrproxy.serasa.intranet:3128'])
        options.add_argument('--disable-geolocation')
        Capybara::Selenium::Driver.new(app, :browser => :chrome, options: options)
    end
    Capybara.ignore_hidden_elements = false
    Capybara.default_max_wait_time = 20

    ###-----------------------------DEPRECATED CODE---------------------------------------###
    #                                                                                       #
    # Capybara.register_driver :selenium_proxy do |app|                                     #
    #    profile = Selenium::WebDriver::Chrome::Profile.new                                 #
    #    profile["network.proxy.type"] = 1                                                  #
    #    profile["network.proxy.http"] = "spobrproxy.serasa.intranet"                       #
    #    profile["network.proxy.http_port"] = 3128                                          #
    #    Capybara::Selenium::Driver.new(app, :browser => :chrome, :profile => profile)      #
    # end                                                                                   #
    #                                                                                       #
    ###---------------------------END DEPRECATED CODE-------------------------------------###

    #Start new driver with chosen browser
    driver = Capybara.default_driver = :selenium_proxy
    path = "../automation-master/features/support/screenshots/bugs"
    # register the new driver to the screenshot callback
    # necessary because lack of it may cause chrome driver to crash
    # does nothing since we are already using AfterStep to handle screenshot
    Capybara::Screenshot.register_driver(:selenium_proxy) do |driver, path|
        page.save_screenshot(path)
    end
   
    Capybara::Screenshot.autosave_on_failure = false

    def close 
        Capybara.current_session.driver.quit
    end   

    def reset_session
        Capybara.reset_session!
    end  

    Before do |scenario|
        close
        @driver = driver
        @scenario_name = scenario.name
    end

    After do |scenario|
        path_failed = "../automation-master/features/support/screenshots/bugs"
        screenshot_file_failed = "BUG-#{@scenario_name}-#{Time.now.strftime('%Y-%m-%d %H-%M-%S')}.png"
        file_path_failed = File.expand_path(path_failed)+'/'+screenshot_file_failed
        page.save_screenshot(file_path_failed) if scenario.failed?
    end

    AfterStep do |scenario, step|
        if scenario.passed?
            path = "../automation-master/features/support/screenshots"
            screenshot_file = "PASSED-#{@scenario_name}-#{Time.now.strftime('%Y-%m-%d %H-%M-%S')}.png"
            file_path = File.expand_path(path)+'/'+screenshot_file
            page.save_screenshot(file_path)
        end
    end



