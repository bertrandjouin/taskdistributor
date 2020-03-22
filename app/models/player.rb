class Player < ApplicationRecord
  belongs_to :user
  validates :pseudo, presence: true
end
