class AddPointsToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :points, :integer
  end
end
