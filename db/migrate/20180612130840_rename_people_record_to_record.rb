class RenamePeopleRecordToRecord < ActiveRecord::Migration[5.1]
   def self.up
    rename_table :people_records, :records
  end

  def self.down
    rename_table :records, :people_records
  end
end
