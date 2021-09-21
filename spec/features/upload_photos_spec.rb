require "rails_helper"

RSpec.describe "Upload photos", type: :feature do
  scenario "User can upload one photos" do
    visit new_upload_path

    attach_file('upload[photos][]', Rails.root + "spec/fixtures/angry.jpg")
    click_on("Upload!")

    assert_text "Emotions in detected face"
  end

  scenario "User can upload multiple photos" do
    visit new_upload_path

    attach_file('upload[photos][]', Rails.root + "spec/fixtures/angry.jpg")
    attach_file('upload[photos][]', Rails.root + "spec/fixtures/surprised.jpg")
    click_on("Upload!")

    assert_text "Emotions in detected face"
  end
end
