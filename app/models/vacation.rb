class Vacation < ApplicationRecord
  belongs_to :employee
  belongs_to :contract
end
