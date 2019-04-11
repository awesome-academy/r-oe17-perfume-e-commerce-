class Role < ApplicationRecord
  has_and_belongs_to_many :users

  validates :role_name, length: {maximum: Settings.model.role.name_maxlength},
            presence: true
end
