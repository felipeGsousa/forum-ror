class User < ApplicationRecord
    has_many :user_forun, dependent: :delete_all
    has_many :foruns, through: :user_forun
    
    has_secure_password
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Try a valid email" }
end
