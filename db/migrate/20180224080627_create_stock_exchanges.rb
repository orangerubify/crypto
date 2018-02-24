class CreateStockExchanges < ActiveRecord::Migration[5.1]
  def change
    create_table :stock_exchanges do |t|
      t.string :name
      t.text :description
      t.string :website
      t.boolean :active
      t.integer :priority

      t.timestamps
    end
  end
end
