  Given(/^an user navigates to Youse website$/) do
    @home_page = HomePage.new
    @home_page.myaccount
    page.should have_content('Olá, somos a Youse')
  end

  When(/^user logs in using an email as (.*)$/) do |email|
    @myaccount_page = LoginRegisterPage.new
    @myaccount_page.setemail(email)
   # expect(page).to have_content('Para continuar, faça login ou registre-se.')
  end

  And(/^password as (.*)$/) do |password|
    @myaccount_page.setpassword(password)
  end

  And(/^the login is successful$/) do
    expect(page).to have_content('Login efetuado com sucesso.')
  end

  And(/^the Account page was displayed$/) do
    page.should have_content('Que tal um seguro 100% online e direto com você?')
  end
  Then(/^user could be logout from My Account page$/) do
    @my_account_page = MyAccountPage.new
    @my_account_page.logout
  end

  And(/^the Home page should be displayed$/) do
    page.should have_content('Olá, somos a Youse')
  end


