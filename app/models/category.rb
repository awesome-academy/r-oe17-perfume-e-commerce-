class Category < ApplicationRecord
  paginates_per Settings.model.category.paginate_size

  has_many :products
  has_many :children, class_name: "Category", foreign_key: :parent_id
  belongs_to :parent, class_name: "Category"

  scope :ordered_by_name, ->{order(category_name: :asc)}
  scope :ordered_by_name, ->{order(category_name: :asc)}

  scope :ordered_by_name, ->{order(category_name: :asc)}

  validates :category_name, length: {maximum: Settings.model.category.name_maxlength},
            presence: true
  validates :description, length: {maximum: Settings.model.category.desc_maxlength}

  scope :ordered_by_name, ->{order(category_name: :asc)}
  scope :top_level, ->{where(parent_id: nil)}

  def descendents
    children.map do |child|
      [child] + child.descendents
    end.flatten
  end

  def self_and_descendents
    [self] + descendents
  end

  def descendent_products
    self_and_descendents.map(&:products).flatten
  end
end
