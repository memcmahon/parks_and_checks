class AddsIdToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :nps_id, :string
  end
end
