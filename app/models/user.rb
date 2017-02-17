# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  email_address :string           not null
#  password      :string           not null
#  session_token :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ActiveRecord::Base
  validates :email_address, :session_token, uniqueness: true
  after_initialize :ensure_session_token
  after_initialize :set_activation_token

  attr_reader :password

  def generate_session_token
    SecureRandom.base64(16)
  end

  def reset_session_token!
    self.session_token = generate_session_token(:session_token)
    self.save
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= generate_session_token(:session_token)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?
    self.password_digest == BCrypt::Password.create(@password)
  end

  def self.find_by_credentials(email, password)
    @user = User.find_by_email(email)
    user && user.is_password?(password) ? user : nil
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :password_digest,
                                 :session_token)
  end
end
