class WarehousesController < ApplicationController
  before_action :set_warehouse, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
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
  end

  def update
    if  @warehouse.update(warehouse_params)
      flash[:notice] = "Galpão editado com sucesso!"
      redirect_to(warehouse_path)
    else
      @errors = @warehouse.errors.full_messages
      flash.now[:notice] = "Galpão não editado"
      render :edit
    end
  end

  def destroy
    if @warehouse.destroy
      redirect_to(root_path, notice:"Galpão removido com sucesso!")
    end
  end

  private

  def set_warehouse
    @warehouse = Warehouse.find(params[:id])
  end

  def warehouse_params
    target_warehouse = params.require(:warehouse).permit(:name, :code, :city, :address, :cep, :area, :description)

    target_warehouse[:code] = target_warehouse[:code].upcase

    return target_warehouse
  end


end
