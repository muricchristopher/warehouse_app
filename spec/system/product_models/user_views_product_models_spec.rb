require 'rails_helper'

describe 'Usuário vê modelos de produtos' do
  it 'a partir do menu' do
    #Arrange

    #Act
    visit root_path

    within ("nav") do
      click_on("Modelo de Produtos")
    end

    expect(current_path).to eq(product_models_path)
    #Assert
  end

  it 'com sucesso' do
    supplier = Supplier.create!(brand_name:"Samsung", corporate_name:"Samsung Eletrônicos LTDA", registration_number: "89012347000180", email:"sac@samsung.com.br" )

    ProductModel.create!(name:"TV 32", weight:8000, width:70, height:45, depth:10, sku:"TV32SAMSUNG12M3MDJFH", supplier: supplier)


    visit root_path

    click_on("Modelo de Produtos")

    expect(page).to have_content("TV 32")
    expect(page).to have_content("TV32SAMSUNG12M3MDJFH")
    expect(page).to have_content("Samsung")
  end

  it 'sem nenhum cadastrado' do
    visit root_path

    click_on("Modelo de Produtos")

    expect(page).to have_content("Nenhum modelo de produto cadastrado!")
  end

end
