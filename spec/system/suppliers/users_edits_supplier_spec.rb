require 'rails_helper'

describe 'Usuário edita um fornecedor' do
  it 'com sucesso' do
    supplier = Supplier.create!(corporate_name: "ABA Produções LTDA", brand_name: "ABA", registration_number:"59291534000167",full_address:"Rua Marechal dos Andares, 1212", city:"São Paulo",
    state:"São Paulo", email:"contato@abaproducuesltda.com.br")

    visit("/")

    click_on("Fornecedores")

    click_on("ABA")

    click_on("Editar")

    fill_in("Razão Social", with:"MARBA Nova Produções LTDA")
    fill_in("Nome Fantasia", with:"MARBA")
    fill_in("CNPJ", with:"59291534000167")
    fill_in("Endereço", with:"Rua Marechal dos Andares, 1212")
    fill_in("Cidade", with:"São Paulo")
    fill_in("Estado", with:"São Paulo")
    fill_in("E-mail", with:"contato@abaproducuesltda.com.br")

    click_on("Salvar")

    expect(page).to have_content("Fornecedor editado com sucesso!")
    expect(page).to have_content("MARBA")
  end

  it 'com dados inválidos ou em branco' do

    supplier = Supplier.create!(corporate_name: "ABA Produções LTDA", brand_name: "ABA", registration_number:"59291534000167",full_address:"Rua Marechal dos Andares, 1212", city:"São Paulo",
    state:"São Paulo", email:"contato@abaproducuesltda.com.br")

    visit("/")

    click_on("Fornecedores")

    click_on("ABA")

    click_on("Editar")

    fill_in("Razão Social", with:"")
    fill_in("Nome Fantasia", with:"MARBA")
    fill_in("CNPJ", with:"59291534000212167")
    fill_in("Endereço", with:"Rua Marechal dos Andares, 1212")
    fill_in("Cidade", with:"São Paulo")
    fill_in("Estado", with:"São Paulo")
    fill_in("E-mail", with:"marbaconsult@")

    click_on("Salvar")

    expect(page).to have_content("Fornecedor não editado")
    expect(page).to have_field("Endereço", with:"Rua Marechal dos Andares, 1212")
    expect(page).to have_content("Razão Social não pode ficar em branco")
    expect(page).to have_content("CNPJ não é válido")
    expect(page).to have_content("E-mail não é válido")

  end
end
