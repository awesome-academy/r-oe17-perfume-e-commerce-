class Category < ApplicationRecord
  has_many :products

  validates :category_name, length: {maximum: Settings.model.category.name_maxlength},
            presence: true
  validates :description, length: {maximum: Settings.model.category.desc_maxlength}
end
