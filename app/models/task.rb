class Task < ApplicationRecord
  belongs_to :user
  has_many :skills, dependent: :destroy
  has_one :attribution, dependent: :destroy
  validates :name, presence: true
end


# @task.attribution.player marche !!!
