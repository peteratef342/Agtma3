class Record < ApplicationRecord
  belongs_to :person
  belongs_to :event

  validates :date, presence: true


end
