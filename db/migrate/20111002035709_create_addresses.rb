class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.string :district
      t.string :state
      t.integer :pincode
      t.string :country
      t.integer :home_id
      t.integer :business_id
      
      t.timestamps
    end
  end
end
