class Player < ApplicationRecord
  belongs_to :user
  has_many :skills, dependent: :destroy
  validates :pseudo, presence: true
end
