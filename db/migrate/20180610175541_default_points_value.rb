class DefaultPointsValue < ActiveRecord::Migration[5.1]
  def change
  	change_column :people, :points, :integer, :default => 0
  end
end
