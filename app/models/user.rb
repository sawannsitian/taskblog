class User < ActiveRecord::Base
  attr_accessible :name, :role, :provider ,:uid ,:oauth_token ,:oauth_expires_at ,:active, :password, :lat, :long
  ROLELIST = ["Manager","Data Collection Exec","Customer Service Exec"]
  ACTIVELIST = {"Block" => 0, "Active" => 1}
  has_many :tasklists

  attr_accessor :password
  before_save :encrypt_password
  
  def self.authenticate(name, password)
    user = find_by_name(name)
    if user && user.hash_pass == BCrypt::Engine.hash_secret(password, user.salt_pass)
      user
    else
      nil
    end
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      active_user = User.find_by_name(auth.info.name)
      if active_user
        if active_user.active
          return User.find_by_name(auth.info.name)
        else
          return false
        end
      else
        user.provider = auth.provider
        user.uid = auth.uid
        user.role = "Data Collection Exec"
        user.active = 1
        user.name = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.save!
      end
    end
  end
  
  def encrypt_password
    if password.present?
      self.salt_pass = BCrypt::Engine.generate_salt
      self.hash_pass = BCrypt::Engine.hash_secret(password, salt_pass)
    end
  end
end
