class User < ActiveRecord::Base
  has_secure_password
  has_many :recipes


  #minimal email validation
  #because I agree with this: http://davidcel.is/posts/stop-validating-email-addresses-with-regex/
  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false},
  format: {with: /@/}


  def display_name
    self.email || 'Anon'
  end

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end
end


