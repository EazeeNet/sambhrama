class CreateNewsTickers < ActiveRecord::Migration
  def change
    create_table :news_tickers do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
