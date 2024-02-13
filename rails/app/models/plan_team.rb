class PlanTeam < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  belongs_to :payment_method
  belongs_to :recurrence
end
