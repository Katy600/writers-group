class CreateWritingOutlets < ActiveRecord::Migration[7.0]
  def change
    create_table :writing_outlets do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
