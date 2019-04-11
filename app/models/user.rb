class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  has_and_belongs_to_many :roles

  validates :email, format: {with: VALID_EMAIL_REGEX},
            length: {maximum: Settings.model.user.email_max_length},
            presence: true,
            uniqueness: {case_sensitive: false}
  validates :first_name, length: {maximum: Settings.model.user.firstname_max_length},
            presence: true
  validates :last_name, length: {maximum: Settings.model.user.lastname_max_length},
            presence: true

  before_save :downcase_email, :set_date_joined

  def set_last_login
    update_attribute(:last_login, DateTime.now)
  end

  def get_fullname
    "#{first_name} #{last_name}"
  end

  private

  def downcase_email
    self.email = email.downcase
  end

  def set_date_joined
    self.date_joined = DateTime.now
  end
end
