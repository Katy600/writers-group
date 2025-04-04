require 'rails_helper'

RSpec.describe "WritingOutlets", type: :request do
  let(:author) { create(:author) }
  let!(:writing_outlet) { create(:writing_outlet, author: author) }

  before do
    sign_in author
  end

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

    context "with no title" do
      before do
        post writing_outlets_url, params: { writing_outlet: { title: "", content: "Some Content" } }
      end

      it "does not create a new writing outlet" do
        expect {
          post writing_outlets_url, params: { writing_outlet: { title: "", content: "Some Content" } }
        }.to change(WritingOutlet, :count).by(0)
      end

      it 'renders the new template' do
        expect(response).to render_template(:new) # Expect to render the 'new' template
      end
    end


    context "with no content" do
      it "does not create a new writing outlet" do
        expect {
          post writing_outlets_url, params: { writing_outlet: { title: "My Title", content: "" } }
        }.to change(WritingOutlet, :count).by(0)
      end
    end
  end

  describe "GET /show" do
    context "with valid parameters" do
      before { get writing_outlet_path(writing_outlet.id) }

      it "returns a successful response" do
        expect(response).to be_successful  # This checks if the response code is 200
      end

      it "renders the show template" do
        expect(response).to render_template(:show)
      end

      it "displays the writing outlet title" do
        expect(response.body).to include("Sample Title")
      end

      it "displays the writing outlet content" do
        expect(response.body).to include("Sample Content")
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

  describe "GET /index" do
    let!(:writing_outlets) { create_list(:writing_outlet, 20) }

    before { get writing_outlets_path } # Ensure request happens after data is created

    it "renders the index template" do
      expect(response).to render_template(:index)
    end

    context "when many writing outlets exist" do
      it "displays a list of outlets" do
        expect(response.body).to include("SAMPLE TITLE")
      end
    end
  end
end
