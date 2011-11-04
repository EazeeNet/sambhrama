class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :message_type
      t.string :message_text_short
      t.string :message_text_long
      t.date :event_date
      t.date :exp_date

      t.timestamps
    end
  end
end
