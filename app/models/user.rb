class User < ActiveRecord::Base

  attr_reader :password

  validates :username, presence: true, uniqueness: true
  validates :session_token, :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  before_validation :ensure_session_token

  has_many :goals

  def self.find_by_credentials(username, password)
    @user = User.find_by_username(username)
    @user.try(:is_password?, password) ? @user : nil
  end

  def password=(plain_text)
    @password = plain_text
    self.password_digest = BCrypt::Password.create(plain_text)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def is_password?(plain_text)
    BCrypt::Password.new(self.password_digest).is_password?(plain_text)
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

end
