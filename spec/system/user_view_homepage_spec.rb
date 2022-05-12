require 'rails_helper'

describe 'Usuário visita tela inicial' do
  it 'e vê o nome do app' do
      #Arrange
      #Act
      #Assert

      visit("/")

      expect(page).to have_content("Galpões & Estoque")
  end

  it 'e vê os galpões cadastrados' do
    #Arrange
    Warehouse.create(name: "Rio", code: "SDU", city:"Rio de Janeiro", area: 60_000, zip_code:"08140490", description:"Um belo galpão", address:"Rua")
    Warehouse.create(name: "Maceio", code: "MCZ", city:"Maceio", area: 40_000, zip_code:"08140490", description:"Um belo galpão", address:"Rua")

    #Act
    visit("/")

    #Assert
    expect(page).to_not have_content("Nenhum galpão cadastrado!")
    expect(page).to have_content("Rio")
    expect(page).to have_content("SDU")
    expect(page).to have_content("Rio de Janeiro")
    expect(page).to have_content(60000)
    expect(page).to have_content("Maceio")
    expect(page).to have_content("MCZ")
    expect(page).to have_content("Maceio")
    expect(page).to have_content(40000)


  end

  it 'e não existem galpões cadastrados' do

    visit("/")

    expect(page).to have_content("Nenhum galpão cadastrado!")
  end
end
