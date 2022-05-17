require 'rails_helper'

describe 'Usuário se cadastra' do
  it 'com sucesso' do
    visit(root_path)

    click_on("Entrar")
    click_on("Cadastre-se")

    fill_in("E-mail", with:"joaozinho@gmail.com")
    fill_in("Senha", with:"123456")
    fill_in("Confirme sua senha", with:"123456")
    click_on("Cadastrar")

    within("nav") do
      expect(page).to have_content("Sair")
      expect(page).to_not have_content("Entrar")
    end
    expect(page).to have_content("Boas vindas! Você realizou seu registro com sucesso.")
    user = User.last

    expect(user.email).to eq("joaozinho@gmail.com")
  end
end
