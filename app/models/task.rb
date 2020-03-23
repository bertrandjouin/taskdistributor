class Task < ApplicationRecord
  belongs_to :user
  has_many :skills, dependent: :destroy
  validates :name, presence: true
end
