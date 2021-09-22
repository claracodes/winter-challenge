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
  end
end
