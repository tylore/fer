class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :twitter
      t.string :password
      t.string :password_confirmation
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
