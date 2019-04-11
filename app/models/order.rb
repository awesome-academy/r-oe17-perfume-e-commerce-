class Order < ApplicationRecord
  has_many :order_details

  validates :ship_address, length: {maximum: Settings.model.order.ship_addr_maxlength},
            presence: true
  validates :ship_city, length: {maximum: Settings.model.ship_city_maxlength},
            presence: true
  validates :ship_name, length: {maximum: Settings.model.order.ship_name.maxlength},
            presence: true

  before_save :set_order_date

  private
  def set_order_date
    update_attribute(:order_date, DateTime.now)
  end
end
