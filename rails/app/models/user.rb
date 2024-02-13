class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :api, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable ,:jwt_authenticatable, jwt_revocation_strategy: self

  has_many :_project_users
  has_many :projects, through: :_project_users
  belongs_to :team, optional: true
end
