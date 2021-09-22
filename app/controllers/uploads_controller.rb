class UploadsController < ApplicationController
  def index
    if params[:filter]
      @photos = ActiveStorage::Attachment.where(name: "photos", emotion: params[:filter]).distinct
    else
      @photos = ActiveStorage::Attachment.where(name: "photos").distinct
    end
  end

  def new
    @upload = Upload.new
  end

  def create
    if params[:upload].nil?
      @upload = Upload.new
      flash[:alert] = "Please select at least one image"
      render :new && return
    end

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
