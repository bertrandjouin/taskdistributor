class Task < ApplicationRecord
  belongs_to :user
  has_many :skills, dependent: :destroy
  has_many :attributions, dependent: :destroy
  validates :name, presence: true
end
