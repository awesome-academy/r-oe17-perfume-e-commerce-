class Category < ApplicationRecord
  paginates_per Settings.model.category.paginate_size

  has_many :products

  scope :ordered_by_name, ->{order(category_name: :asc)}

  validates :category_name, length: {maximum: Settings.model.category.name_maxlength},
            presence: true
  validates :description, length: {maximum: Settings.model.category.desc_maxlength}
end
