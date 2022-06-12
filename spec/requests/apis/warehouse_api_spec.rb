require 'rails_helper'

describe 'Warehouse API', type: :request do
  context "GET api/v1/warehouses/:warehouse" do

    it 'success' do
      warehouse = Warehouse.create!(name: "Galpão do Rio", code: "SDU", city:"Rio de Janeiro", area: 60_000, zip_code:"08140490", description:"Um belo galpão", address:"Rua")

      get("/api/v1/warehouses/#{warehouse.id}")

      json_response = JSON.parse(response.body)
                      #response.body is a string
                      #json_response is a hash with the json data of the response

      expect(json_response["name"]).to eq(warehouse.name)
      expect(json_response["code"]).to eq(warehouse.code)
      expect(response).to have_http_status(200)
      expect(response.status).to eq(200)
      expect(response.content_type).to include('application/json')
      expect(response.body).to include('Galpão do Rio')
    end

  end
end
