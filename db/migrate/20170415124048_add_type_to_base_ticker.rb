class AddTypeToBaseTicker < ActiveRecord::Migration[5.0]
  def change
    add_column :base_tickers, :type, :string
  end
end
