require 'rails_helper'

describe "Usuário cadastra um galpão" do

  it 'a partir da tela inicial' do

    visit(root_path)

    click_on("Cadastrar Galpão")

    expect(page).to have_field("Nome")
    expect(page).to have_field("Descrição")
    expect(page).to have_field("Endereço")
    expect(page).to have_field("Código")
    expect(page).to have_field("Cidade")
    expect(page).to have_field("Área")
    expect(page).to have_field("CEP")
  end

  it 'com sucesso' do

    visit(root_path)

    click_on("Cadastrar Galpão")

    fill_in "Nome",	with: "Galpão de Teste"
    fill_in "Descrição",	with: "Um Belo Galpão"
    fill_in "Endereço",	with: "Rua do Galpão"
    fill_in "Código",	with: "AB4"
    fill_in "Cidade",	with: "São Paulo"
    fill_in "Área",	with: '20000'
    fill_in "CEP",	with: "08140490"

    click_on("Enviar")

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Galpão cadastrado com sucesso!")
    expect(page).to have_content("Galpão de Teste")

  end

  it 'com dados incompletos' do
     visit(root_path)

    click_on("Cadastrar Galpão")

    fill_in "Nome",	with: ""
    fill_in "Descrição",	with: ""

    click_on("Enviar")

    expect(page).to have_content("Galpão não cadastrado")
    expect(page).to have_content("Nome não pode ficar em branco")
    expect(page).to have_content("Nome não pode ficar em branco")
  end

end
