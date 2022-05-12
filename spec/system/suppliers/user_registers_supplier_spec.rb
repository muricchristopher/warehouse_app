require 'rails_helper'

describe 'Usuário cadastra um fornecedor' do
  it 'a partir do menu' do
    visit(root_path)

    click_on("Fornecedores")

    click_on("Cadastrar Fornecedor")

    expect(page).to have_field("Razão Social")
    expect(page).to have_field("Nome Fantasia")
    expect(page).to have_field("CNPJ")
    expect(page).to have_field("Endereço")
    expect(page).to have_field("Estado")
    expect(page).to have_field("Cidade")
    expect(page).to have_field("E-mail")
  end

  it 'com sucesso' do
    visit(root_path)

    click_on("Fornecedores")

    click_on("Cadastrar Fornecedor")

    fill_in("Razão Social", with:"ABA Produções LTDA")
    fill_in("Nome Fantasia", with:"ABA")
    fill_in("CNPJ", with:"59291534000167")
    fill_in("Endereço", with:"Rua Marechal dos Andares, 1212")
    fill_in("Cidade", with:"São Paulo")
    fill_in("Estado", with:"São Paulo")
    fill_in("E-mail", with:"contato@abaproducuesltda.com.br")

    click_on("Salvar")

    expect(page).to have_content("ABA")
    expect(page).to have_content("ABA Produções LTDA")
    expect(page).to have_content("São Paulo")
    expect(page).to have_content("São Paulo")
    expect(page).to have_content("contato@abaproducuesltda.com.br")
  end

  it 'com dados incompletos' do
    visit(root_path)

    click_on("Fornecedores")
    click_on("Cadastrar Fornecedor")

    fill_in("Razão Social", with:"")
    fill_in("Nome Fantasia", with:"ABA")
    fill_in("CNPJ", with:"")
    fill_in("Endereço", with:"")
    fill_in("Cidade", with:"São Paulo")
    fill_in("Estado", with:"São Paulo")
    fill_in("E-mail", with:"contatoemail")

    click_on("Salvar")

    expect(page).to have_content("Fornecedor não cadastrado")
    expect(page).to have_content("Razão Social não pode ficar em branco")
    expect(page).to have_content("CNPJ não é válido")

  end


end
