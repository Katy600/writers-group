require 'rails_helper'

RSpec.describe Author, type: :model do
  context "with 1 outlet" do
    it "orders them in reverse chronologically" do
      author = Author.new
      author.title = "My first outlet"
      author.content = "My goodness what fun"

      expect(author.length).to eq(1)
    end
  end
end
