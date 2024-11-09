class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :password_digest, presence: true
  has_secure_password

  def as_json
    super.except("id", "password_digest")
  end
end
