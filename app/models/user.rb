class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable,:omniauthable

  has_many :notes
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  # has_secure_password
  has_many :notes
  has_many :likes
  has_many :like_notes, through: :likes, source: :note
  
  validates :sex, presence: true
  validates :major, presence: true
  validates :birthday, presence: true
  validates :university, presence: true
  validates :national, presence: true
  #has_secure_password
  validates :password, length: { minimum: 6 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def set_image(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/user_images/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image = file_name
    end
  end

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create(
        uid: auth.uid,
        provider: auth.provider,
        name: auth.info.name,
        email: User.get_email(auth),
        password: Devise.friendly_token[4, 30])
    end
    user
  end

  private
    def self.get_email(auth)
      email = auth.info.email
      email = "#{auth.provider}-#{auth.uid}@example.com" if email.blank?
      email
    end
end

def self.find_for_oauth(auth)
  user = User.where(uid: auth.uid, provider: auth.provider).first
  unless user
    user = User.create(
      uid: auth.uid,
      provider: auth.provider,
      name: auth.info.name,
      email:User.get_email(auth),
      password: Devise.friendly_token[4, 30])
  end
  user
end

private
  def self.get_email(auth)
    email = auth.info.email
    email = "#{auth.provider}-#{auth.uid}@example.com" if email.blank?
    email


    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end


