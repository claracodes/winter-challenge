class UploadsController < ApplicationController
  def index
    @uploads = Upload.all
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    if @upload.save
      redirect_to emotion_upload_path
    else
      render :new
    end
  end

  def emotion
    @upload = Upload.find_by(params[:id])
  end

  private

  def upload_params
    params.require(:upload).permit(photos: [])
  end

end
