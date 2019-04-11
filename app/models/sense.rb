class Sense < ApplicationRecord
  has_many :products

  validates :sense_name, length: {maximum: Settings.model.sense.name_maxlength},
            presence: true
end
