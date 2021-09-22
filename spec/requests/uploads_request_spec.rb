require 'rails_helper'

RSpec.describe "Uploads", type: :request do
    describe "POST /create without photos" do
      it "renders new again" do
        get "/uploads/new"

        expect(response).to render_template("uploads/new")
      end
    end
end
