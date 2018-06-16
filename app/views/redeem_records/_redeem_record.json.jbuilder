json.extract! redeem_record, :id, :person_id, :redeem_item_id, :created_at, :updated_at
json.url redeem_record_url(redeem_record, format: :json)
