require 'rails_helper'

describe 'Usuário acessa os detalhes de um modelo de produto' do
  context 'vendo informações adicionais' do
    it 'e retorna' do
      supplier = Supplier.create!(brand_name:"Samsung", corporate_name:"Samsung Eletrônicos LTDA", registration_number: "89012347000180", email:"sac@samsung.com.br")

      ProductModel.create!(name:"TV 32", weight:900, width:70, height:45, depth:10, sku:"TV32SAMSUNG12M3MDJFH", supplier: supplier)

      visit(root_path)
      click_on("Modelo de Produtos")
      click_on("TV 32")

      expect(page).to have_content("TV 32")
      expect(page).to have_content("Dimensões: 45 cm x 70 cm x 10 cm")
      expect(page).to have_content("Peso: 900")
      expect(page).to have_content("SKU: TV32SAMSUNG12M3MDJFH")
      expect(page).to have_content("Fornecedor: Samsung")

      click_on("Voltar")
      expect(current_path).to eq(product_models_path)
    end

    it 'e acessa informações detalhadas do fornecedor' do
      supplier = Supplier.create!(brand_name:"Samsung", corporate_name:"Samsung Eletrônicos LTDA", registration_number: "89012347000180", email:"sac@samsung.com.br")

      ProductModel.create!(name:"TV 32", weight:8000, width:70, height:45, depth:10, sku:"TV32SAMSUNG12M3MDJFH", supplier: supplier)

      visit(root_path)
      click_on("Modelo de Produtos")
      click_on("TV 32")
      click_on("Samsung")

      expect(page).to have_content("Samsung Eletrônicos LTDA")
      expect(page).to have_content("89012347000180")
      expect(page).to have_content("sac@samsung.com.br")
  end
end
end
