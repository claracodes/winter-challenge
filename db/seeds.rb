# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

# link to dataset = 'https://github.com/onnx/models/blob/master/vision/body_analysis/emotion_ferplus/model/emotion-ferplus-8.onnx'
data_set = File.open(Rails.root + "spec/fixtures/model.onnx")
ml_model = MlModel.new(name: "Face Emotions")
ml_model.model.attach(io: data_set, filename: "Face Emotion Data Model")
ml_model.save

links = [
  'https://images.unsplash.com/photo-1541112324160-e8a425b58dac?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8ZmVhciUyMGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y29udGVtcHQlMjBmYWNlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1594819047050-99defca82545?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHN1cnByaXNlJTIwZmFjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1608975321345-3e26cbf0f017?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3VycHJpc2UlMjBmYWNlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1601412436967-8b2d90944ded?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2FkJTIwZmFjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1568914882731-5bf24aa2a994?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bmV1dHJhbCUyMGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
]
upload = Upload.new(name: 'From seeds')
links.each_with_index do |link, index|
  file = URI.open(link)
  upload.photos.attach([{io: file, filename: "from_seed_#{index}.png", content_type: 'image/png'}])
end
upload.save
upload.add_emotions_to_photos
