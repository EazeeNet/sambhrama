class AddCommunicationField < ActiveRecord::Migration
  def up
    add_column :addresses, :communication_id, :integer
  end

  def down
    remove_column :addresses, :communication_id
  end
end
