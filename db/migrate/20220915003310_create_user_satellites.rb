class CreateUserSatellites < ActiveRecord::Migration[5.2]
  def change
    create_table :user_satellites do |t|
      t.references :user, foreign_key: true
      t.references :satellite, foreign_key: true
    end
  end
end
