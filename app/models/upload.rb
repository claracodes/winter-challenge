class Upload < ApplicationRecord
  has_many_attached :photos, service: :cloudinary

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
end
