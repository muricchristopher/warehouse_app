class Api::V1::ApiController <  ActionController::API
  rescue_from ActiveRecord::ActiveRecordError, with: :return_500
  rescue_from ActiveRecord::RecordNotFound, with: :return_404

  private

  def return_500
    render(json: {message: "Internal Error"}, status: 500)
  end

  def return_404
    render(json: { message: "Warehouse with '#{params[:id]}' ID not found" }, status: 404)
  end
end
