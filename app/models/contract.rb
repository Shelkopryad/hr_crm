class Contract < ApplicationRecord
  belongs_to :employee
  has_many :vacation

  NUMBER_OF_VACATION_DAYS = 20


end
