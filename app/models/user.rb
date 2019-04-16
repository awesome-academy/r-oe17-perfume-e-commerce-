class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  attr_accessor :remember_token, :activation_token

  has_and_belongs_to_many :roles
  has_secure_password

  validates :email, format: {with: VALID_EMAIL_REGEX},
            length: {maximum: Settings.model.user.email_max_length},
            presence: true,
            uniqueness: {case_sensitive: false}
  validates :first_name, length: {maximum: Settings.model.user.firstname_max_length},
            presence: true
  validates :last_name, length: {maximum: Settings.model.user.lastname_max_length},
            presence: true
  validates :password, presence: true, length: {minimum: Settings.model.user.password_min_length}

  before_create :create_activation_digest
  before_save :downcase_email, :set_date_joined

  class << self
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated? attribute, token
    digest = send("#{attribute}_digest")
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password?(token)
  end

  def activate
    update_attribute(:is_active, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def set_last_login
    update_attribute(:last_login, DateTime.now)
  end

  def get_fullname
    "#{first_name} #{last_name}"
  end

  def in_role? name
    role_list = Role.by_id(id).map(&:role_name)
    role_list.include? name
  end

  def is_mod?
    in_role? "Moderator"
  end

  def is_admin?
    in_role? "Administrator"
  end

  private

  def downcase_email
    self.email = email.downcase
  end

  def set_date_joined
    self.date_joined = DateTime.now
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end
