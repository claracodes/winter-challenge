class Upload < ApplicationRecord
  has_many_attached :photos, service: :cloudinary
  validate :photo_validation

  EMOTIONS = [
    "neutral", "happiness", "surprise", "sadness",
    "anger", "disgust", "fear", "contempt"
  ].freeze

  def add_emotions_to_photos
    self.emotions = {} if self.emotions.nil?

    self.photos.each do |photo|
      all_emotions = GenerateEmotionsService.call(photo)
      self.emotions[photo.blob_id] = all_emotions
      photo.emotion = all_emotions.first.first
      photo.save
      self.save
    end
  end

  def photo_validation
    if photos.attached?
      photos.each do |photo|
        if photo.blob.byte_size >  10_485_760
          name = photo.blob.filename
          errors[:base] << "#{name} is too big"
        elsif !photo.blob.content_type.starts_with?('image/')
          name = photo.blob.filename
          errors[:base] << "#{name} has wrong format, only images"
        end
      end
    end
  end
end
