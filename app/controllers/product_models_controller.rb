class ProductModelsController < ApplicationController

  # before_action :authenticate_user!, only: [:index, :show, :new, :create]

  def index
    @products = ProductModel.all
  end

  def show
    @product = ProductModel.find(params[:id])
  end

  def new
    @productModel = ProductModel.new
  end

  def create

    product_model_params = params.require(:product_model).permit(:name, :weight, :width, :height, :depth, :sku, :supplier_id)

    @productModel = ProductModel.new(product_model_params)

    if @productModel.save
      flash[:notice] = "Modelo de Produto cadastrado com sucesso!"

      redirect_to(product_models_path)
    else
      @errors = @productModel.errors.full_messages
      flash[:notice] = "Modelo de Produto não cadastrado"
      render :new
    end



  end
end
