class WarehousesController < ApplicationController
  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def new

  end

  def create
    warehouse_params = params.require(:warehouse).permit(:name, :code, :city, :address, :cep, :area, :description)

    created_warehouse = Warehouse.new(warehouse_params)

    if created_warehouse.save()
     flash[:notice] = "Galpão cadastrado com sucesso!"
    end


    redirect_to(root_path)
  end


end
