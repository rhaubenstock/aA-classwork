class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, presence: true, uniqueness: true
  validates :user_id, presence: true

  def self.random_code
    # generating random strings until we find one that is not a short_url in the database
    # then we return it
    random_short_url = SecureRandom::urlsafe_base64
    until !ShortenedUrl.exists?(short_url: random_short_url)
  end
end