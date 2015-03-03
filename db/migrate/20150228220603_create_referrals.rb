class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.string :user_input
      t.boolean :is_happy
      t.boolean :is_emo
      t.boolean :is_hate
      t.boolean :is_awesome
      t.boolean :is_shock

      t.timestamps null: false
    end
  end
end
