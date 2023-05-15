class Employee < ApplicationRecord
  has_many :history_point, dependent: :destroy
  has_one_attached :photo
  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :birthdate, presence: true
  validates :current_position, presence: true
end
