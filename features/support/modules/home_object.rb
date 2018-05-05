module HomeObject
  include Capybara::DSL

  URL = 'http://www.youse.com.br'

  def visit
    super(URL) #This goes to the Begin Page
  end

  def myaccount
      visit
      click_link(@botao_minha_conta)
  end

  def about
    visit
    click_link('Sobre a Youse')
  end

  def autoinsurance
    visit
    click_link('Seguro Auto')
  end

  def lifeinsurance
    visit
    click_link('Seguro Vida')
  end

  def residentialinsurance
    visit
    click_link('Seguro Vida')
  end
end