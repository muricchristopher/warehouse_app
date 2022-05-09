require 'rails_helper'

describe 'Usuário registra um galpão' do

  it 'a partir dos detalhes de um galpão' do

    first_warehouse = Warehouse.create!(name: "Galpão do Rio", code: "SDU", city:"Rio de Janeiro", area: 60_000, cep:"08140490", description:"Um belo galpão", address:"Rua")

    visit("/")
    click_on("Galpão do Rio")
    click_on("Editar")

    expect(page).to have_field("Nome", with:first_warehouse.name)
    expect(page).to have_field("Descrição", with:first_warehouse.description)
    expect(page).to have_field("Endereço", with:first_warehouse.address)
    expect(page).to have_field("Código", with:first_warehouse.code)
    expect(page).to have_field("Cidade", with: first_warehouse.city)
    expect(page).to have_field("Área", with:first_warehouse.area)
    expect(page).to have_field("CEP", with:first_warehouse.cep)
  end

  it 'e com sucesso' do
    first_warehouse = Warehouse.create!(name: "Galpão do Rio", code: "SDU", city:"Rio de Janeiro", area: 60_000, cep:"08140490", description:"Um belo galpão", address:"Rua")

    visit("/")
    click_on("Galpão do Rio")
    click_on("Editar")

    fill_in("Nome", with:"Meu Galpão Personalizado")
    fill_in("Código", with:"GPT")
    fill_in("Descrição", with:"Galpão editado")

    click_on("Salvar alterações")

    expect(page).to have_content("Galpão editado com sucesso!")
    expect(page).to have_content("Meu Galpão Personalizado")
    expect(page).to have_content("Código: GPT")
    expect(page).to have_content("Descrição: Galpão editado")
  end

  it 'com dados incompletos' do
    first_warehouse = Warehouse.create!(name: "Galpão do Rio", code: "GPR", city:"Rio de Janeiro", area: 60_000, cep:"08140490", description:"Um belo galpão", address:"Rua")

    visit("/")
    click_on("Galpão do Rio")
    click_on("Editar")

    fill_in("Nome", with:"")
    fill_in("Código", with:"")
    fill_in("Descrição", with:"Galpão editado")

    click_on("Salvar alterações")

    expect(page).to have_content("Galpão não editado")
    expect(page).to have_content("Nome não pode ficar em branco")
    expect(page).to have_content("Código não pode ficar em branco")
  end

end



