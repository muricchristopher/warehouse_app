require 'rails_helper'

describe 'Usuário vê detalhes de um fornecedor' do

  it 'com informações adicionais' do

    supplier = Supplier.create!(corporate_name: "ABA Produções LTDA", brand_name: "ABA", registration_number:"92348329432",full_address:"Rua Marechal dos Andares, 1212", city:"São Paulo",
    state:"São Paulo", email:"contato@abaproducuesltda.com.br")

    visit("/")

    click_on("Fornecedores")

    click_on("ABA")

    expect(page).to have_content(supplier.corporate_name)
    expect(page).to have_content(supplier.registration_number)
    expect(page).to have_content(supplier.full_address)
    expect(page).to have_content(supplier.city)
    expect(page).to have_content(supplier.state)
    expect(page).to have_content(supplier.email)

  end

  it 'e volta para a tela inicial' do
    supplier = Supplier.create!(corporate_name: "ABA Produções LTDA", brand_name: "ABA", registration_number:"92348329432",full_address:"Rua Marechal dos Andares, 1212", city:"São Paulo",
    state:"São Paulo", email:"contato@abaproducuesltda.com.br")

    visit("/")

    click_on("Fornecedores")

    click_on("ABA")

    click_on("Voltar")

    expect(current_path).to eq(suppliers_path)

  end

end
