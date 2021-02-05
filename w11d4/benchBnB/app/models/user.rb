class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: {minimum: 6}, allow_nil: true

    after_initialize :ensure_session_token

    attr_reader :password 

    def self.find_by_credentials(email, pw)
       user = User.find_by(email: email) 
       if user && user.is_password?(pw)
          user
       end
    end

    def password=(pw)
        @password = password
        self.password_digest = BCrypt::Password.create(pw)
    end

    def is_password?(pw)
        BCrypt::Password.new(self.password_digest).is_password?(pw)
    end

    def reset_session_token
        self.session_token = SecureRandom::base64
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::base64
    end
end
