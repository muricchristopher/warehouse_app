require 'rails_helper'

describe 'Usuário se autentica' do
  it 'com suceso' do
    User.create!(name:"João", email:"joaoaguialr@gmail.com", password:"password")

    visit(root_path)

    click_on("Entrar")

    within("form") do
      fill_in("E-mail", with:"joaoaguialr@gmail.com")
      fill_in("Senha", with:"password")
      click_on("Fazer Login")
    end

    expect(page).to have_content("Login efetuado com sucesso.")

    within("nav") do
      expect(page).to_not have_content("Entrar")
      expect(page).to have_content("Sair")
    end

  end
end
