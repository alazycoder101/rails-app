class User < ApplicationRecord
  extend FriendlyId
  friendly_id :friendify, use: :slugged
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::Allowlist

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :confirmable, :trackable,
        :jwt_authenticatable, jwt_revocation_strategy: self
end
