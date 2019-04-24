class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true,
            numericality: {greater_than: Settings.model.product.lower_bound}
  validate :product_present
  validate :order_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.unit_price
    end
  end

  def total_price
    unit_price * quantity
  end

  private
  def product_present
    if product.nil?
      errors.add(:product, t("models.order_details.product_nil"))
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, t("models.order_details.order_nil"))
    end
  end

  def finalize
    self.unit_price = unit_price
    self.total_price = quantity * unit_price
  end
end
