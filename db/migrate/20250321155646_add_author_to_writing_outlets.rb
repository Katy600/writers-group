class AddAuthorToWritingOutlets < ActiveRecord::Migration[7.0]
  def change
    add_reference :writing_outlets, :author, null: false, foreign_key: true
  end
end
