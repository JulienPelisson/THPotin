class JoinTableMpUser < ApplicationRecord
  belongs_to :recipient
  belongs_to :private_message
end
