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

  it 'e com sucesso' do

    visit(root_path)

    click_on("Cadastrar Galpão")

    fill_in "Nome",	with: "Galpão de Teste" 

    click_on("Enviar")
  
    expect(current_path).to eq(root_path) 
    expect(page).to have_content("Galpão cadastrado com sucesso!")
    expect(page).to have_content("Galpão de Teste") 
    
  end

end
