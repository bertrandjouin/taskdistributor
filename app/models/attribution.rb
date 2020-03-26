class Attribution < ApplicationRecord
  belongs_to :player
  belongs_to :task, dependent: :destroy
  belongs_to :mixandmatch
end
