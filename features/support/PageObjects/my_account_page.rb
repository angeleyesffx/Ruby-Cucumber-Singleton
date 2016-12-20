class MyAccountPage
  include Capybara::DSL

  def logout
    page.find(:css,'.account-dropdown__menu:nth-child(2)').click
    click_link('Sair')
    end
end