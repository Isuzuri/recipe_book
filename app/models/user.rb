class User < ApplicationRecord
    has_secure_password

    validates :email, :password, presence: true
    validates :email, uniqueness: true
    validates :email, format: { with: /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}/, message: "invalid format" }
    validates :password, length: { minimum: 6, message: "password length must be more than 6 symbols" }
end
