require 'rails_helper'

RSpec.describe Author, type: :model do
  author = Author.new
  author.name = 'Katy'
  author.email = "katy@example.com"

  context "New Author is created with an email address" do
    it "orders them in reverse chronologically" do
      expect(author.name).to eq('Katy')
      expect(author.email).to eq('katy@example.com')
    end

    context "The author creates a new outlet" do
      author2 = author.writing_outlets.new
      author2.title = "Today is the day!"
      author2.content = "To be just who you are"

      it "Create a new outlet" do
        expect(author2.title).to eq("Today is the day!")
        expect(author2.content).to eq("To be just who you are")
      end
    end
  end
end
