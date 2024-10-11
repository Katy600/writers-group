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
    before do
      WritingOutlet.create(title: "First Post", content: "This is the first post")
      WritingOutlet.create(title: "Second Post", content: "This is the second post")
      WritingOutlet.create(title: "Third Post", content: "This is the third post")
      WritingOutlet.create(title: "Fourth Post", content: "This is the fourth post")
    end

    context "with valid parameters" do
      it "displays the recent writing outlet" do
        writing_outlet = JSON.parse(response.body)
        expect(response).to be_successful
        expect(writing_outlet["title"]).to eq('My Title')
        expect(writing_outlet["content"]).to eq('Some Content')

      end
    end
  end
end
