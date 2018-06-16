class RedeemRecord < ApplicationRecord
  belongs_to :person
  belongs_to :redeem_item
end
