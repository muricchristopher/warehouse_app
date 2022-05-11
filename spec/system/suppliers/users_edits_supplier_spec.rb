require 'rails_helper'

describe 'Usuário edita um fornecedor' do
  it 'a partir dos detalhes' do
    supplier = Supplier.create!(corporate_name: "ABA Produções LTDA", brand_name: "ABA", registration_number:"59291534000167",full_address:"Rua Marechal dos Andares, 1212", city:"São Paulo",
    state:"São Paulo", email:"contato@abaproducuesltda.com.br")

    visit("/")

    click_on("Fornecedores")

    click_on("ABA")

    click_on("Editar")

    fill_in("Nome Empresarial", with:"MARBA Nova Produções LTDA")
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
end
