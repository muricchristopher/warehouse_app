require 'rails_helper'

describe 'Usuário autenticado remove um galpão' do
  it 'com sucesso' do
    user = User.create!(email:"testando@teste.com.br", password:123456)
    login_as(user)

    Warehouse.create!(name: "Galpão do Rio", code: "GPR", city:"Rio de Janeiro", area: 60_000, zip_code:"08140490", description:"Um belo galpão", address:"Rua")

    visit("/")
    click_on("Galpão do Rio")
    click_on("Deletar")

    expect(page).to have_content("Galpão removido com sucesso!")
    expect(page).to_not have_content("Galpão do Rio")
    expect(page).to_not have_content("Código GPR")
    expect(page).to_not have_content("Cidade Rio de Janeiro")
    expect(page).to_not have_content("Área 60000")
  end

  it 'sem interferir nos demais' do
    user = User.create!(email:"testando@teste.com.br", password:123456)
    login_as(user)

    Warehouse.create(name: "Galpão Rio", code: "SDU", city:"Rio de Janeiro", area: 60_000, zip_code:"02140490", description:"Um belo galpão no Rio", address:"Rua")
    Warehouse.create(name: "Galpão Maceio", code: "MCZ", city:"Maceio", area: 40_000, zip_code:"08140490", description:"Um belo galpão em Maceio", address:"Rua")

    visit("/")

    click_on("Galpão Rio")
    click_on("Deletar")

    expect(page).to have_content("Galpão removido com sucesso!")
    expect(page).to_not have_content("Galpão do Rio")
    expect(page).to_not have_content("Código: SDU")
    expect(page).to have_content("Galpão Maceio")
    expect(page).to have_content("Código: MCZ")

  end
end
