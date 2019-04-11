class Product < ApplicationRecord
  VALID_PRICE_REGEX = /\A\d+(?:\.\d{2})?\z/.freeze

  belongs_to :category
  belongs_to :supplier
  belongs_to :sense
  belongs_to :brand
  has_many :order_details

  validates :concentration, length: {maximum: Settings.model.product.concentration_maxlength}
  validates :discontinue, default: false
  validates :description, length: {maximum: Settings.model.product.description_maxlength}
  validates :product_name, length: {maximum: Settings.model.product.name_maxlength},
            presence: true
  validates :product_style, length: {maximum: Settings.model.product.product_style_maxlength}
  validates :picture_url, length: {maximum: Settings.model.product.picture_url_maxlength}
  validates :quantity_per_init, length: {maximum: Setttings.model.product.qit_maxlength}
  validates :unit_price, format: {with: VALID_PRICE_REGEX},
            numericality: {greater_than: Settings.model.product.lower_bound,
                           less_than: Settings.model.product.upper_bound}
  validates :unit_in_stock, numericality: {greater_than: Settings.model.product.lower_bound},
            presence: true
  validates :unit_in_order, numericality: {less_than: :unit_in_stock}
  validates :weight, numericality: {less_than: Settings.model.product.weight_upper_bound}
end
