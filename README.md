# Ruby-Cucumber-Singleton

## To install Ruby-Cucumber ###

a) Download the Ruby version 2.4.x x64 on http://rubyinstaller.org/downloads/

b) Install on directory C:\Ruby24-x64

c) Before press Install button on wizard window, check all the checkboxes.

d) After install, open the console and check the installation using the command ruby –v, if is succeful the ruby version shows up.

e) Install the webdrivers for your browser: 

   Chrome => https://sites.google.com/a/chromium.org/chromedriver/home
   
   Firefox => https://github.com/mozilla/geckodriver/releases
   
   Microsoft-edge => https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/
   
f) Extract webdriver on the folder C:\Ruby24-x64\bin, after extract, close the folder.

g) On the console screen, clone this project using git clone PROJECT_PATH on your favorite folder.

h) Install Bundler using the command gem install bundler.

i) Go to the project folder and install the gems listed on Gemfile, with the command bundle install.

j) Run one feature with =>  bundle exec cucumber features/feature_name.feature TEST_ENV=environment

l) Cucumber complains that you need ANSICON to get console colors because Windows doesn’t understand ANSI color escape sequences. 
   Download ANSICON from http://adoxa.3eeweb.com/ansicon/. Extract it whatever you like it. 
   
m) Run ansicon -i. Exit that command window and open a new one.

## SUBLIME: ##

a) Donwload sublime: https://www.sublimetext.com/2

b) Click the Preferences > Browse Packages… menu

c) Browse up a folder and then into the Installed Packages/ folder

d) Download Package Control.sublime-package and copy it into the Installed Packages/ directory

e) Restart Sublime Text

f) Open Command Palette (<Cmd> + <Shift> + P on a Mac, or access via Tools menu)
	
g) Find and select “Package Control: Install Package”

h) Find and install “Gherkin (Cucumber) Formatter”
