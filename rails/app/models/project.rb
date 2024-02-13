class Project < ApplicationRecord
  has_many :_project_users, dependent: :destroy
  has_many :users, through: :_project_users
  has_many :integration
end
