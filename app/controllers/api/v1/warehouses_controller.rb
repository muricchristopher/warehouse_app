class Api::V1::WarehousesController < ActionController::API
  before_action :warehouse_params, only: [:create]
  rescue_from ActiveRecord::ActiveRecordError, with: :return_500
  rescue_from ActiveRecord::RecordNotFound, with: :return_404

  def index
    warehouses = Warehouse.all.order(:name)

    if warehouses.empty?
      return render(json: { message: "No warehouse found"}, status: 200)
    end

    render(json: warehouses.to_json(except: [:created_at, :updated_at]), status: 200)
  end

  def show
      #begin rescue is used to catch the exception if the warehouse is not found
      # begin rescue is simillary to try/catch in Js
      warehouse = Warehouse.find(params[:id])

      render(json: warehouse.to_json(except: [:created_at, :updated_at], include: [:orders]), status: 200)

  end

  def create

    warehouse = Warehouse.new(warehouse_params)

    if warehouse.save
        render(json: warehouse.to_json(except: [:created_at, :updated_at]), status: 201)
    else
        render(json: { errors: warehouse.errors.full_messages }, status: 412)
    end


  end

  private

  def warehouse_params
    params.require(:warehouse).permit(:name, :code, :city, :area, :zip_code, :description, :address)
  end

  def return_500
    render(json: {message: "Internal Error"}, status: 500)
  end

  def return_404
    render(json: { message: "Warehouse with '#{params[:id]}' ID not found" }, status: 404)
  end

end
