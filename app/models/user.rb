class User < ApplicationRecord
  has_secure_password validations: false

  has_many :wishlists
  has_many :items, through: :wishlists
  has_many :reviews
  validates :username, :password, :first_name, presence: true, if: :password_required
  validates :username, :email_address, uniqueness: true
  validates :username, :password, confirmation: { case_sensitive: true }, if: :password_required
  validates :password, length: { in: 8..30 }, if: :password_required

  PASSWORD_REQUIREMENTS = /\A
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
  (?=.*[[:^alnum:]]) # Must contain a symbol
  /x

  validates :password , format: { with: PASSWORD_REQUIREMENTS}, if: :password_required


  def self.omniauth_login(auth_hash)
    if self.find_by(uid: auth_hash['uid'])
      user = self.find_by(uid: auth_hash['uid'])
      user
    else
      username = auth_hash['info']['nickname']
      first_name = auth_hash['info']['name']
      #email_address = auth_hash['info']['email']
      #u.image = auth_hash['info']['image']
      #u.url = auth_hash['info']['urls']['GitHub']
      user = self.new(uid: auth_hash['uid'], username: username, first_name: first_name)
      user.password_required = false
      user
    end
  end

end
