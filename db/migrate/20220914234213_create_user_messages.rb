class CreateUserMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :user_messages do |t|
      t.references :user, foreign_key: true
      t.references :message, foreign_key: true
      t.integer :user_role
    end
  end
end
