# Image repository with emotion detection for faces

This is a image repository with emotion detection for faces. After uploading one or multiple images, we're making use of a [pretrained model](https://github.com/onnx/models/tree/master/vision/body_analysis/emotion_ferplus) that will run over the faces detected in those images. The face detection is done via Cloudinary which is also the store for the photos. After uploading your images you can see the results and filter all uploaded images by emotions.

### Setup

This Rails app is online and can be viewed [here](https://winter-challenge-clara.herokuapp.com/) or it can be launched locally by cloning the project and running the following commands:

Ruby 2.7.2 is required.

```
bundle install

rails db:create
rails db:migrate
rails db:seed

rails s
```

Then navigate to [localhost:3000](http://localhost:3000) and start uploading images with faces.
Here are some links with different facial expressions:

- [image](https://unsplash.com/photos/3QsoKG6RXtE) | [Download link](https://unsplash.com/photos/3QsoKG6RXtE/download?force=true) (from Unsplash)
- [image](https://unsplash.com/photos/nwYas4Usbac) | [Download link](https://unsplash.com/photos/nwYas4Usbac/download?force=true) (from Unsplash)

### Testing

You can run tests with `bundle exec rspec`.
Once you run the tests you can check `coverage/index.html` for test coverage (currently at 98%).

### Tools and Inspiration

- Boilerplate for Rails app from Le Wagon bootcamp with Postgres Database, simpleform and debugging tools [lewagon/rails-templates](https://github.com/lewagon/rails-templates)
- Inspiration for the emotion detection came from this [article](https://ankane.org/emotion-recognition-ruby)
