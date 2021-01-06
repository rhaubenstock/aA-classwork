require 'byebug'
class User < ApplicationRecord
    validates :username, :password_digest, presence: true
    validates :username, uniqueness: true
    validates :session_token, presence: true, uniqueness: true
    validates :password, length: { minimum: 6}, allow_nil: true

    has_many :goals,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Goal

    attr_reader :password

    after_initialize :ensure_session_token

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64 
    end

    def password=(pw)
        self.password_digest = BCrypt::Password.create(pw)
        @password = pw
    end

    def is_password?(pw)
        BCrypt::Password.new(self.password_digest).is_password?(pw)
    end

    def self.find_by_credentials(username, pw)
        user = User.find_by(username: username)

        if user && user.is_password?(pw)
            user
        else
            nil
        end
    end
end
