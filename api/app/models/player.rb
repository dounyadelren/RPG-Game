class Player < ApplicationRecord

    # for register 
    has_secure_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    before_save { self.email = email.downcase }

    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
end
