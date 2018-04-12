class CreateImage < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :park
      t.string :park_url
      t.string :credit
      t.string :alt_text
      t.string :title
      t.string :caption
      t.string :url

      t.timestamps
    end
  end
end
