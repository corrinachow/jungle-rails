class User < ActiveRecord::Base

  validates :fname, presence: true
  validates :lname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    email = email.strip
    user = User.where('lower(email) = ?', email.downcase).first

    if user && user.authenticate(password)
      @user = user
    else
      nil
    end
  end

end
