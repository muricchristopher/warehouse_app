require 'rails_helper'

describe "Usuário vê detalhes de um galpão" do
  
  it 'e vê inforações adicionais' do
    #Arrange
    w = Warehouse.new(name:"Rio", code:"RIO", city:"Rio de Janeiro", area:20000, address:"Rua Rio, 020", cep:"08190-950", description:"Um belo galpão no Rio")
    w.save()
    #Act
    visit("/")
    click_on(w.name)

    #Assert
    expect(page).to have_content(w.description)  
    expect(page).to have_content(w.address)  

  end

  it 'e volta para a tela inicial' do
    w = Warehouse.new(name:"Rio", code:"RIO", city:"Rio de Janeiro", area:20000, address:"Rua Rio, 020", cep:"08190-950", description:"Um belo galpão no Rio")
    w.save()

    visit("/")
    click_on(w.name)
    click_on("Voltar")

    expect(current_path).to eq('/')
  end

end
