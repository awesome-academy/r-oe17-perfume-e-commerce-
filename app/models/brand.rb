class Brand < ApplicationRecord
  paginates_per 5

  has_many :products

  validates :brand_name, length: {maximum: Settings.model.brand.name_maxlength},
            presence: true
  validates :country_name, length: {maximum: Settings.model.brand.country_maxlength}
  validates :description, length: {minimum: Settings.model.brand.desc_minlength,
                                   maximum: Settings.model.brand.desc_maxlength},
            presence: true
  validates :homepage, length: {maximum: Settings.model.brand.homepage_maxlength}

  scope :ordered_by_name, ->{order(brand_name: :desc)}
end
