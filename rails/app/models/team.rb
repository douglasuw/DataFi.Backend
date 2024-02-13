class Team < ApplicationRecord
    devise :api, :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable ,:jwt_authenticatable, jwt_revocation_strategy: self
end
