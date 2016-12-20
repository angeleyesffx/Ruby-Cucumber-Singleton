#encoding: utf-8

 require 'capybara/cucumber'
 require 'capybara/rspec'
 require 'selenium-webdriver'

 Capybara.default_driver = :selenium
 Capybara.default_max_wait_time = 20
 Capybara.javascript_driver = :webkit
