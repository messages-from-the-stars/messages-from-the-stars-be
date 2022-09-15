class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :satellite_id
      t.float :start_lat
      t.float :start_lng
      t.string :content

      t.timestamps
    end
  end
end
