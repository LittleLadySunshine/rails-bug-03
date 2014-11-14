class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: {case_sensitive: false}
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :email, presence: true

  before_validation do
    self.email = email? ? email.downcase : nil
  end
end
