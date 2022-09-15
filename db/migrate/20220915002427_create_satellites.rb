class CreateSatellites < ActiveRecord::Migration[5.2]
  def change
    create_table :satellites do |t|
      t.integer :norad_id
    end
  end
end
