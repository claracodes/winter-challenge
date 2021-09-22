require "rails_helper"

RSpec.describe "See all photos", type: :feature do
  before do
    create_upload
  end

  scenario "User can see all photos" do
    visit uploads_path

    page.assert_selector('img', count: 3)

  end
end
