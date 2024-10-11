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

  describe "GET /show" do
    let!(:writing_outlet) { WritingOutlet.create(title: "My Title", content: "Some Content") }

    context "with valid parameters" do
      before { get writing_outlet_path(writing_outlet.id) }

      it "returns a successful response" do
        expect(response).to be_successful  # This checks if the response code is 200
      end

      it "renders the show template" do
        expect(response).to render_template(:show)
      end

      it "displays the writing outlet title" do
        expect(response.body).to include("My Title")
      end

      it "displays the writing outlet content" do
        expect(response.body).to include("Some Content")
      end
    end

    context "when the writing outlet does not exist" do
      before { get writing_outlet_path(id: -1) } # Requesting a non-existent ID

      it "returns a 404 not found status" do
        expect(response).to have_http_status(:not_found)
      end

      it "renders the default 404 page" do
        expect(response.body).to include("404") # Ensure this matches your 404 page content
      end
    end
  end
end
