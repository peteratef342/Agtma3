class CreatePersonRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :people_records do |t|
      t.references :person, foreign_key: true, index: true
      t.references :event, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
