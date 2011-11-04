class CreateThoughtOfDays < ActiveRecord::Migration
  def change
    create_table :thought_of_days do |t|
       t.string :string
      t.timestamps
    end
  end
end
