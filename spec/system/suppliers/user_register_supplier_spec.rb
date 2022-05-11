require 'rails_helper'

describe 'Usuário cadastra um fornecedor' do
  it 'a partir do menu' do
    visit(root_path)

    click_on("Fornecedores")

    click_on("Cadastrar Fornecedor")

    expect(page).to have_field("Nome da Empresa")
    expect(page).to have_field("Nome Fantasia")
    expect(page).to have_field("CNPJ")
    expect(page).to have_field("Endereço")
    expect(page).to have_field("Estado")
    expect(page).to have_field("Cidade")
    expect(page).to have_field("E-mail")


  end
end
