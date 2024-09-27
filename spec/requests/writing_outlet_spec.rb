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
          post writing_outlets_url, params: { writing_outlet: { title: "My Title", content: "Some Content" } }
        }.to change(WritingOutlet, :count).by(1)
      end

      it "redirects to the created piece of writing" do
        post writing_outlets_url, params: { writing_outlet: { title: "My Title", content: "Some Content" } }
        expect(response).to redirect_to(writing_outlet_path(WritingOutlet.last))
      end
    end
  end

  # describe "GET /show" do
  #   it "displays "
  #
  # end
end
