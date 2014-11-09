class User < ActiveRecord::Base
  attr_accessible :name, :role, :provider ,:uid ,:active, :password, :latitude, :longitude, :email
  # validates :password , presence: true, length: { minimum: 4 }
  # validates :email,:name, presence: true, uniqueness: true
  # validates_email_format_of :email, :message => 'email add is not valid'

  ROLELIST = ["Data Collection Exec","Manager","Customer Service Exec"]
  ACTIVELIST = {"Active" => 1,"Block" => 0}
  scope :data_collection, lambda { where(:role => 'Data Collection Exec') }
  has_many :tasklists

  attr_accessor :password
  before_save :encrypt_password
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.hash_pass == BCrypt::Engine.hash_secret(password, user.salt_pass)
      user
    else
      nil
    end
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      active_user = User.find_by_uid(auth.uid)
      if active_user
        if active_user.try(:active)
          return active_user
        else
          return false
        end
      else
        user.provider = auth.provider
        user.uid = auth.uid
        user.password = auth.uid
        user.role = "Data Collection Exec"
        user.active = 1
        user.name = auth.info.name
        user.email = auth.info.email
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
