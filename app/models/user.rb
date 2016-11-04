class User < ApplicationRecord

has_secure_password
acts_as_follower
acts_as_followable
has_secure_token :api_token
attachment :avatar

has_many :posts

validates :email,
          presence: true,
          uniqueness: true

validates :email,
          format: /\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\b/




end
