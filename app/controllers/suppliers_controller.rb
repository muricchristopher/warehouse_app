class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def new
    @supplier = Supplier.new
  end

  def create
    supplier_params = params.require(:supplier).permit(:corporate_name, :brand_name, :registration_number, :full_address, :city, :state, :email)

    @supplier = Supplier.new(supplier_params)

    if @supplier.save()
      redirect_to(suppliers_path, notice:"Fornecedor cadastrado com sucesso!")
    else
      @errors = @supplier.errors.full_messages

      flash.now[:notice] = "Fornecedor não cadastrado"

      render :new
    end

  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])

    supplier_params = params.require(:supplier).permit(:corporate_name, :brand_name, :registration_number, :full_address, :city, :state, :email)

    if @supplier.update(supplier_params)
      flash[:notice] = "Fornecedor editado com sucesso!"
      redirect_to(supplier_path)
    else
      flash[:notice] = "Fornecedor não editado"
      @errors = @supplier.errors.full_messages

      render :edit
    end

  end
end
