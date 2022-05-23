require 'rails_helper'

RSpec.describe Order, type: :model do

  describe '#valid?' do
    it 'false when code is nil' do
      user = User.create!(name:"João", email:"joao@gmail.com", password:"123456")

      supplier = Supplier.create!(brand_name:"Samsung", corporate_name:"Samsung Eletrônicos LTDA", registration_number: "89012347000180", email:"sac@samsung.com.br")

      warehouse = Warehouse.create!(name: "Galpão do Rio", code: "SDU", city:"Rio de Janeiro", area: 60_000, zip_code:"08140490", description:"Um belo galpão", address:"Rua")

      order = Order.create!(warehouse: warehouse, user:user, supplier:supplier, estimated_delivery_date: "2022-10-21")

      expect(order).to be_valid
    end
  end
  describe 'Generate a random and unique code' do
    it 'when create a new order' do
      user = User.create!(name:"João", email:"joao@gmail.com", password:"123456")

      supplier = Supplier.create!(brand_name:"Samsung", corporate_name:"Samsung Eletrônicos LTDA", registration_number: "89012347000180", email:"sac@samsung.com.br")

      warehouse = Warehouse.create!(name: "Galpão do Rio", code: "SDU", city:"Rio de Janeiro", area: 60_000, zip_code:"08140490", description:"Um belo galpão", address:"Rua")

      first_order = Order.create!(warehouse: warehouse, user:user, supplier:supplier, estimated_delivery_date: "2022-10-21")
      second_order = Order.create!(warehouse: warehouse, user:user, supplier:supplier, estimated_delivery_date: "2022-10-21")

      first_code = first_order.code
      second_code = second_order.code

      expect(first_code).not_to(be_empty)
      expect(first_code).not_to(be_nil)
      expect(first_code).not_to eq(second_code)
      expect(first_code.length && second_code.length).to eq(11)
    end
  end
end
