require 'securerandom'

class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :name
  validates :email, presence: true, 
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, allow_nil: false }, 
            uniqueness: { case_sensitive: false }

  before_create :set_token


  private

  
  def set_token
    self.token= SecureRandom.hex
  end
end
