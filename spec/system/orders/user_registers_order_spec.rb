require 'rails_helper'

describe "Usuário cadastra um pedido" do

  it 'com sucesso' do
    user = User.create!(name:"João", email:"joao@gmail.com", password:"123456")
    supplier = Supplier.create!(brand_name:"Samsung", corporate_name:"Samsung Eletrônicos LTDA", registration_number: "89012347000180", email:"sac@samsung.com.br")
    warehouse = Warehouse.create!(name: "Galpão do Rio", code: "SDU", city:"Rio de Janeiro", area: 60_000, zip_code:"08140490", description:"Um belo galpão", address:"Rua")

    allow(SecureRandom).to receive(:hex).and_return("32D5F9A10A")

    login_as(user)

    visit(root_path)

    click_on("Cadastrar Pedido")

    select("Galpão do Rio", from:"Galpão")
    select("Samsung Eletrônicos LTDA", from:"Fornecedor")

    select '11', :from => 'order_estimated_delivery_date_3i'
    select 'outubro', :from => 'order_estimated_delivery_date_2i'
    select '2022', :from => 'order_estimated_delivery_date_1i'

    click_on("Salvar")

    expect(page).to have_content("Pedido cadastrado com sucesso!")
    expect(page).to have_content("Pedido: #32D5F9A10A")
    expect(page).to have_content("Galpão Destino: SDU | Galpão do Rio")
    expect(page).to have_content("Fornecedor: Samsung Eletrônicos LTDA")
    expect(page).to have_content("Data Prevista de Entrega: 11/10/2022")
    expect(page).to have_content("Usuário responsável: João - joao@gmail.com")


  end


end

