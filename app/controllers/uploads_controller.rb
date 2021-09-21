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
      redirect_to emotion_upload_path(@upload)
    else
      render :new
    end
  end

  def emotion
    @upload = Upload.find(params[:id])
    @upload.add_emotions_to_photos if @upload.emotions.nil?
    @upload.save
  end

  private

  def upload_params
    params.require(:upload).permit(photos: [])
  end
end
