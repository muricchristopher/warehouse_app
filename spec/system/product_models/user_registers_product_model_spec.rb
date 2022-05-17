require 'rails_helper'

describe 'Usuário cadastra um modelo de produto' do
  it 'com sucesso' do
    user = User.create!(email:"testando@teste.com.br", password:123456)
    login_as(user)

    supplier = Supplier.create!(brand_name:"Samsung", corporate_name:"Samsung Eletrônicos LTDA", registration_number: "89012347000180", email:"sac@samsung.com.br" )
    other_supplier = Supplier.create!(brand_name:"LG", corporate_name:"LG Eletrônicos LTDA", registration_number: "12346347000120", email:"sac@LG.com.br" )

    visit("/")

    click_on("Modelo de Produtos")

    click_on("Cadastrar Modelo de Produto")
    fill_in("Nome", with:"TV 32")
    fill_in("Peso", with:8000)
    fill_in("Largura", with:70)
    fill_in("Altura", with:45)
    fill_in("Profundidade", with:10)
    fill_in("SKU", with:"TV32SAMSUNG12M3MDJFH")
    select("Samsung", from: "Fornecedor")
    click_on("Salvar")

    expect(page).to have_content("Modelo de Produto cadastrado com sucesso!")
  end

  it 'com dados incompletos' do
    user = User.create!(email:"testando@teste.com.br", password:123456)
    login_as(user)

    supplier = Supplier.create(brand_name:"Samsung", corporate_name:"Samsung Eletrônicos LTDA", registration_number: "89012347000180", email:"sac@samsung.com.br" )

    visit("/")

    click_on("Modelo de Produtos")

    click_on("Cadastrar Modelo de Produto")
    fill_in("Nome", with:"")
    fill_in("SKU", with:"ASD")
    fill_in("Peso", with:8000)
    click_on("Salvar")

    expect(page).to have_content("Modelo de Produto não cadastrado")
    expect(page).to have_content("Nome não pode ficar em branco")
    expect(page).to have_content("SKU não possui o tamanho esperado")
    expect(page).to have_field("Peso", with:"8000")
  end
end
