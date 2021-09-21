class MlModelsController < ApplicationController
  def new
    @ml_model = MlModel.new
  end

  def create
    @ml_model = MlModel.new(ml_model_params)
    if @ml_model.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def ml_model_params
    params.require(:ml_model).permit(:name, :model)
  end
end
