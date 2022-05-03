class HomeController < ApplicationController
  def index
  end

  def create
    @teste = Object.new(params[:teste])
    if @teste.save
      flash[:success] = "Object successfully created"
      redirect_to @teste
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
end
