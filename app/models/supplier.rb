class Supplier < ApplicationRecord
  paginates_per 5

  has_many :products

  validates :address, length: {maximum: Settings.model.supplier.address_maxlength}
  validates :company_name, length: {maximum: Settings.model.supplier.company_name_maxlength},
            presence: true
  validates :contact_name, length: {maximum: Settings.model.supplier.contact_name_maxlength}
  validates :city, length: {maximum: Settings.model.supplier.city_maxlength}
  validates :homepage, length: {maximum: Settings.model.supplier.homepage_maxlength}

  scope :ordered_by_name, ->{order(company_name: :asc)}
end
