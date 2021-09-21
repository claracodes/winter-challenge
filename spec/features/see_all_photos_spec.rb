require "rails_helper"

RSpec.describe "See all photos", type: :feature do
  before do
    links = [
      'https://images.unsplash.com/photo-1541112324160-e8a425b58dac?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8ZmVhciUyMGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y29udGVtcHQlMjBmYWNlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1594819047050-99defca82545?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHN1cnByaXNlJTIwZmFjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    ]

    upload = Upload.new(name: 'For test')
    links.each_with_index do |link, index|
      file = URI.open(link)
      upload.photos.attach([{io: file, filename: "for_test_#{index}.png", content_type: 'image/png'}])
    end
    upload.save
  end
  scenario "User can see all photos" do
    visit uploads_path

    page.assert_selector('img', count: 3)

  end
end
