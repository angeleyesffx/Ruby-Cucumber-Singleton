module LoginRegisterPage
  include Capybara::DSL

  def setemail(email)
      fill_in "email", :with => email
      click_button('próximo passo')
  end

  def setpassword(password)
    fill_in "Senha", :with => password
    click_button('entrar')
  end

  def register(name,email,password,confirmpass)
    click_link('Cadastre-se')
    fill_in "Nome", :with => name
    fill_in "E-mail", :with => email
    fill_in "Senha", :with => password
    fill_in "Confirme sua senha", :with => confirmpass
    click_button('enviar cadastro')
  end

end