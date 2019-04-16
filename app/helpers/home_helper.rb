module HomeHelper
  def sortable column, title, direction
    css_class = "dropdown-item"
    direction = direction
    link_to title, {sort: column, direction: direction}, class: css_class
  end
end
