class Api::V1::WarehousesController < ActionController::API

  def index
    @warehouse = Warehouse.all
    render json: @warehouse, status: 200
  end

  def show
    @warehouse = Warehouse.find(params[:id])
    render json: @warehouse, status: 200
  end

end
