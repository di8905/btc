class CreateDeals < ActiveRecord::Migration[5.0]
  def change
    create_table :deals do |t|
      t.decimal :value, precision: 10, scale: 5
      t.integer :updated
      t.references :dealdata, polymorphic: true, index: true

      t.timestamps
    end
  end
end
