class User < ActiveRecord::Base
  ROLES = %w[admin user]
  has_one :profile
  has_many :reviews
  has_many :products, :through => :reviews
  has_secure_password

  validates_presence_of :email, :notice => "You need to provide an email."
  validates_uniqueness_of :email, :notice => "That email is already in use."

end
