class User

  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }
  
  validates :password, length: { minimum: 6 }

  has_many :comments
end
