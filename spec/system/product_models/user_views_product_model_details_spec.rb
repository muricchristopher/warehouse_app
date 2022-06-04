require 'rails_helper'

describe 'Usuário acessa os detalhes de um modelo de produto' do
  context 'vendo informações adicionais' do
    it 'e retorna' do
      user = User.create!(email:"testando@teste.com.br", password:123456)
      login_as(user)

      supplier = Supplier.create!(brand_name:"Samsung", corporate_name:"Samsung Eletrônicos LTDA", registration_number: "89012347000180", email:"sac@samsung.com.br")

      ProductModel.create!(name:"TV 32", weight:900, width:70, height:45, depth:10, sku:"TV32SAMSUNG12M3MDJFH", supplier: supplier)

      visit(root_path)
      click_on("Modelo de Produtos")
      click_on("TV 32")

      expect(page).to have_content("TV 32")
      expect(page).to have_content("Dimensões:")
      expect(page).to have_content("45cm x 70cm x 10cm")
      expect(page).to have_content("Peso:")
      expect(page).to have_content("900kg")
      expect(page).to have_content("SKU:")
      expect(page).to have_content("TV32SAMSUNG12M3MDJFH")
      expect(page).to have_content("Fornecedor:")
      expect(page).to have_content("Samsung")

      click_on("Voltar")
      expect(current_path).to eq(product_models_path)
    end

    it 'e acessa informações detalhadas do fornecedor' do
      user = User.create!(email:"testando@teste.com.br", password:123456)
      login_as(user)

      supplier = Supplier.create!(brand_name:"Samsung", corporate_name:"Samsung Eletrônicos LTDA", registration_number: "89012347000180", email:"sac@samsung.com.br")

      ProductModel.create!(name:"TV 32", weight:8000, width:70, height:45, depth:10, sku:"TV32SAMSUNG12M3MDJFH", supplier: supplier)

      visit(root_path)
      click_on("Modelo de Produtos")
      click_on("TV 32")
      click_on("Samsung Eletrônicos LTDA")

      expect(page).to have_content("Samsung Eletrônicos LTDA")
      expect(page).to have_content("89012347000180")
      expect(page).to have_content("sac@samsung.com.br")
  end
end
end
