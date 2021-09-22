# Image repository with emotion detection for faces

This is a image repository with emotion detection for faces. After uploading one or multiple images, a pretrained model will be run over the faces detected in those images. Afterwards you can see the result.

This Rails app is online and can be viewed [here](https://winter-challenge-clara.herokuapp.com/) or it can be locally launched by cloning the project and running the following commands:

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
[image](https://unsplash.com/photos/3QsoKG6RXtE) | [Download link](https://unsplash.com/photos/3QsoKG6RXtE/download?force=true) (from Unsplash)
[image](https://unsplash.com/photos/nwYas4Usbac) | [Download link](https://unsplash.com/photos/nwYas4Usbac/download?force=true) (from Unsplash)

You can run tests with `bundle exec rspec`

Tools used:

- Boilerplate for Rails app from Le Wagon bootcamp with Postgres Database, simpleform and debugging tools [lewagon/rails-templates](https://github.com/lewagon/rails-templates)
- Inspiration for the emotion detection came from this [article](https://ankane.org/emotion-recognition-ruby)
