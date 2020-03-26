class Task < ApplicationRecord
  belongs_to :user
  has_many :skills, dependent: :destroy
  has_many :attributions
  validates :name, presence: true
end
