class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :points
      t.string :mobile
      t.date :birthdate

      t.timestamps
    end

    add_reference :people, :family, index: true
  	add_reference :people, :system, index: true
  	add_reference :people, :college, index: true

  end
end
