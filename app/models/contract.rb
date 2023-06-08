class Contract < ApplicationRecord
  belongs_to :employee
  has_many :vacation
end
