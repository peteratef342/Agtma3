class CreateRedeemRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :redeem_records do |t|
      t.references :person, foreign_key: true
      t.references :redeem_item, foreign_key: true

      t.timestamps
    end
  end
end
