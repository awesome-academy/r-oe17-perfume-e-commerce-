class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true,
            numericality: {greater_than: Settings.model.product.lower_bound}
end
