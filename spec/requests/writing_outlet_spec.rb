require 'rails_helper'

RSpec.describe "WritingOutlets", type: :request do
  describe "GET /new" do
    it "renders a successful response" do
      get new_writing_outlet_path
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new writing outlet" do
        expect {
          post writing_outlet_url, params: { writing_outlet: valid_attributes }
        }.to change(WritingOutlet, :count).by(1)
      end

      it "redirects to the created article" do
        post writing_outlet_url, params: { writing_outlet: valid_attributes }
        expect(response).to redirect_to(writing_outlet_url(WritingOutlet.last))
      end
    end
  end
end
