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

  def edit
    @warehouse = Warehouse.find(params[:id])
  end

  def update
    warehouse_params = params.require(:warehouse).permit(:name, :code, :city, :address, :cep, :area, :description)

    warehouse_params[:code] = warehouse_params[:code].upcase


    @warehouse = Warehouse.find(params[:id])

    if  @warehouse.update(warehouse_params)
      flash[:notice] = "Galpão editado com sucesso!"
      redirect_to(warehouse_path(@warehouse.id))
    else
      @errors = @warehouse.errors.full_messages
      flash.now[:notice] = "Galpão não editado"
      render :edit
    end


  end


end
