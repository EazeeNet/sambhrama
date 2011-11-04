class CreateContactUs < ActiveRecord::Migration
  def change
    create_table :contact_us do |t|
      t.string :name
      t.string :address
      t.integer :phoneno
      t.string :email
      t.string :comment

      t.timestamps
    end
  end
end
