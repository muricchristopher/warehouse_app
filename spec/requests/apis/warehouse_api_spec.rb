require 'rails_helper'

describe 'Warehouse API', type: :request do
  # example of an endpoint: api/v1/warehouses
  # endpoints are defined in config/routes.rb

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
      expect(json_response.keys).not_to include("created_at")
      expect(json_response.keys).not_to include("updated_at")
    end

    it 'fail if warehouse not found' do
      get("/api/v1/warehouses/21")

      json_response = JSON.parse(response.body)
      expect(response.status).to eq(404)
      expect(json_response["message"]).to eq("Warehouse with '21' ID not found")
    end

  end

  context "GET api/v1/warehouses" do

    it 'lista all warehouses ordered by name' do
      Warehouse.create!(name: "Galpão do Rio", code: "SDU", city:"Rio de Janeiro", area: 60_000, zip_code:"08140490", description:"Um belo galpão", address:"Rua")
      Warehouse.create!(name: "Galpão Alagoas", code: "GSP", city:"São Paulo", area: 60_000, zip_code:"11120410", description:"Um belo galpão em Sp", address:"Rua dos Felícios, 22")

      get("/api/v1/warehouses")

      json_response = JSON.parse(response.body)
      expect(response.content_type).to include("application/json")
      expect(response.status).to eq(200)
      expect(json_response.length).to eq(2)
      expect(json_response.first["name"]).to eq("Galpão Alagoas")
      expect(json_response.last["name"]).to eq("Galpão do Rio")
    end

    it 'return empty if there is no warehouse' do
      get("/api/v1/warehouses")

      json_response = JSON.parse(response.body)
      expect(response.content_type).to include("application/json")
      expect(response.status).to eq(200)
      expect(json_response["message"]).to eq("No warehouse found")
    end

  end

  context "POST api/v1/warehouses" do

    it 'success' do
      warehouse_params =
        { :warehouse =>
          { name: "Galpão do Rio", code: "SDU", city:"Rio de Janeiro", area: 60_000, zip_code:"08140490", description:"Um belo galpão", address:"Rua dos Flamingos" }
        }
      # warheouse_params is a payload of the request

      post("/api/v1/warehouses/", params: warehouse_params)

      json_response = JSON.parse(response.body)
      expect(json_response["name"]).to eq("Galpão do Rio")
      expect(json_response["code"]).to eq("SDU")
      expect(json_response["city"]).to eq("Rio de Janeiro")
      expect(json_response["area"]).to eq(60000)
      expect(json_response["zip_code"]).to eq("08140490")
      expect(json_response["description"]).to eq("Um belo galpão")
      expect(json_response["address"]).to eq("Rua dos Flamingos")
      expect(response).to have_http_status(201)
      expect(response.content_type).to include('application/json')
      expect(json_response.keys).not_to include("created_at")
      expect(json_response.keys).not_to include("updated_at")
    end

    it 'fail if parameters is not complete' do
      warehouse_params =
        { :warehouse =>
          { name: "", code: "", city:"Rio de Janeiro", area: 60_000, zip_code:"23", description:"Um belo galpão", address:"Rua dos Flamingos" }
        }

      post("/api/v1/warehouses/", params: warehouse_params)

      json_response = JSON.parse(response.body)
      expect(response.content_type).to include("application/json")
      expect(response).to have_http_status(412)
      expect(Warehouse.all).to eq([])

      expect(json_response["errors"]).to include("Nome não pode ficar em branco")
      expect(json_response["errors"]).to include("Código não pode ficar em branco")
      expect(json_response["errors"]).to include("CEP não é válido")
      expect(json_response["errors"]).not_to include("Cidade não pode ficar em branco")
    end

    it 'fail if there is an internal error' do
      allow(Warehouse).to receive(:new).and_raise(ActiveRecord::ActiveRecordError)

      warehouse_params =
        { :warehouse =>
          { name: "", code: "", city:"Rio de Janeiro", area: 60_000, zip_code:"23", description:"Um belo galpão", address:"Rua dos Flamingos" }
        }

      post("/api/v1/warehouses/", params: warehouse_params)

      expect(response).to have_http_status(500)
    end

  end


end
