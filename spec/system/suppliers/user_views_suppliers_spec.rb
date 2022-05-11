require 'rails_helper'

describe 'Usuário visualiza os fornecedores' do

  context 'a partir do menu' do

    it 'com fornecedores cadastrados' do

      supplier = Supplier.create!(corporate_name: "ABA Produções LTDA", brand_name: "ABA", registration_number:"59291534000167",full_address:"Rua Marechal dos Andares, 1212", city:"São Paulo",
      state:"São Paulo", email:"contato@abaproducuesltda.com.br")

      visit("/")

      within 'nav' do
        click_on("Fornecedores")
      end

      expect(page).to have_content(supplier.corporate_name)
      expect(page).to have_content(supplier.state)
      expect(page).to have_content(supplier.city)
      expect(page).to have_content(supplier.email)
    end

    it 'sem fornecedores cadastrados' do

      visit("/")

      click_on("Fornecedores")

      expect(page).to have_content("Nenhum fornecedor cadastrado!")
    end

  end

end
