class WarehousesController < ApplicationController
  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    warehouse_params = params.require(:warehouse).permit(:name, :code, :city, :address, :cep, :area, :description)

    warehouse_params[:code] = warehouse_params[:code].upcase

    @warehouse = Warehouse.new(warehouse_params)

    if @warehouse.save()
     flash[:notice] = "Galpão cadastrado com sucesso!"
      redirect_to(root_path)
    else
      @errors = @warehouse.errors.full_messages

      flash.now[:notice] = "Galpão não cadastrado"

      render :new
    end



  end


end
