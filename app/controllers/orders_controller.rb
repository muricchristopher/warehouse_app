class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
  end

  def create
    order_params = params.require(:order).permit(:supplier_id, :warehouse_id, :estimated_delivery_date)

    @order = Order.new(order_params)

    @order.user_id = current_user.id

    if @order.save
      redirect_to(@order, notice:"Pedido cadastrado com sucesso!")
    else
      @errors = @order.errors.full_messages
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @order = Order.find(params[:id])
  end
end
