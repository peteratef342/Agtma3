class AddAddressToPerson < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :address, :string
  end
end
