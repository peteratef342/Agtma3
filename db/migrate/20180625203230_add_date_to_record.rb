class AddDateToRecord < ActiveRecord::Migration[5.1]
  def change
    add_column :records, :date, :date
  end
end
