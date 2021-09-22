# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Upload, type: :model do

  describe '#add_emotions_to_photos' do
    let(:upload) { create_upload }

    it 'adds emotions hash to upload' do
      expect { upload.add_emotions_to_photos }.to change{ upload.emotions }
    end

    it 'adds emotion to single photo' do
      expect { upload.add_emotions_to_photos }.to change{ upload.photos.first.emotion }
    end

    it 'checks if photo attachment is too big' do
      upload = Upload.new(name: 'For test')
      file = File.open(Rails.root.join('spec/fixtures/big_image.CR2'))
      upload.photos.attach([{io: file, filename: "big_image.CR2", content_type: 'image/png'}])

      expect(upload.valid?).to be false
      expect(upload.errors.messages[:base]).to eq(["big_image.CR2 is too big"])
    end

    it 'checks if attachment has right format' do
      upload = Upload.new(name: 'For test')
      file = File.open(Rails.root.join('spec/fixtures/small_pdf.pdf'))
      upload.photos.attach([{io: file, filename: "small_pdf.pdf", content_type: 'application/pdf'}])

      expect(upload.valid?).to be false
      expect(upload.errors.messages[:base]).to eq(["small_pdf.pdf has wrong format, only images"])
    end
  end
end
