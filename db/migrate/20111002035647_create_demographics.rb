class CreateDemographics < ActiveRecord::Migration
  def change
    create_table :demographics do |t|
      t.string :first_name
      t.string :last_name
      t.string :prefix
      t.string :gender
      t.date :dob
      t.string :email
      t.string :mobile
      t.string :comm_pref
      t.integer :user_id
      
      t.timestamps
    end
  end
end
