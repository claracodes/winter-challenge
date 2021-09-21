class Upload < ApplicationRecord
  has_many_attached :photos, service: :cloudinary

  def add_emotions_to_photos
    self.emotions = {} if self.emotions.nil?

    self.photos.each do |photo|
      self.emotions[photo.blob_id] = GenerateEmotionsService.call(photo)
      self.save
    end
  end
end
