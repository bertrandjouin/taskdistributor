class Task < ApplicationRecord
  belongs_to :user
  has_many :skills, dependent: :destroy
  has_one :attribution
  validates :name, presence: true
end


# @task.attribution.player marche !!!
