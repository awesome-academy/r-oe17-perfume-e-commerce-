class Order < ApplicationRecord
  belongs_to :order_status
  has_many :order_details

  validates :ship_address, length: {maximum: Settings.model.order.ship_addr_maxlength}
  validates :ship_city, length: {maximum: Settings.model.order.ship_city_maxlength}
  validates :ship_name, length: {maximum: Settings.model.order.ship_name_maxlength}

  validates_presence_of :ship_address, :ship_city, :ship_name

  before_validation :update_order_status
  before_save :set_order_date, :update_subtotal

  def subtotal
    order_details.map{|od| od.valid? ? (od.quantity * od.unit_price) : 0}.sum
  end

  private
  def set_order_date
    self.order_date = DateTime.now
  end

  def update_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self.subtotal = subtotal
  end
end
