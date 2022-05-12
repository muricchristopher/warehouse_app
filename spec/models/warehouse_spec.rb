require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe "#valid?" do
    context "presence" do
        it "false when 'name' is empty" do
        warehouse = Warehouse.new(name: "", code: "SDU", city:"Rio de Janeiro", area: 60_000, zip_code:"82382", description:"Um belo galpão", address:"Rua")


        expect(warehouse).to_not be_valid
      end
      it "false when 'code' is empty" do
        warehouse = Warehouse.new(name: "Rio", code: "", city:"Rio de Janeiro", area: 60_000, zip_code:"82382", description:"Um belo galpão", address:"Rua")


        expect(warehouse).to_not be_valid
      end
      it "false when 'description' is empty" do
        warehouse = Warehouse.new(name: "Rio", code: "ABL", city:"Rio de Janeiro", area: 60_000, zip_code:"82382", description:"", address:"Rua")
        expect(warehouse).to_not be_valid
      end
    end

    it "false when code is already in use" do

      first_warehouse = Warehouse.create(name: "Rio", code: "SDU", city:"Rio de Janeiro", area: 60_000, zip_code:"82382", description:"Um belo galpão", address:"Rua")

      second_warehouse = Warehouse.new(name: "Outro", code: "SDU", city:"São Paulo", area: 60_000, zip_code:"82382", description:"Um belo galpão", address:"Rua São Paulo")

      expect(second_warehouse).to_not be_valid

    end

    it 'false when name is already in use' do

      first_warehouse = Warehouse.create(
      name: "Galpão SP", code: "GSP",
      city: "São Paulo", area:20_000,
      zip_code:"07190100", description:"Um belo galpão em São Paulo", address:"Rod. Hélio Smidt"
      )
      second_warehouse = Warehouse.create(
      name: "Galpão SP", code: "GAP",
      city: "São Paulo", area:40_000,
      zip_code:"07192100", description:"Um belo galpão em São Paulo", address:"Rod. Tadeu Schmidt"
      )

      expect(second_warehouse).to_not be_valid


    end


    it 'false with invalid zip_code' do
      warehouse = Warehouse.create(name: "Rio", code: "SDU", city:"Rio de Janeiro", area: 60_000, zip_code:"82382", description:"Um belo galpão", address:"Rua")


      expect(warehouse).to_not be_valid
    end


  end

    it 'false code format in lowcase' do
      warehouse = Warehouse.create(name: "Rio", code: "sdu", city:"Rio de Janeiro", area: 60_000, zip_code:"07192100", description:"Um belo galpão", address:"Rua")

      validation = warehouse.code == "SDU"

      expect(validation).to eq(true)
    end




end
