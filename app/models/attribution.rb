class Attribution < ApplicationRecord
  belongs_to :player
  belongs_to :task
  belongs_to :mixandmatch
end
