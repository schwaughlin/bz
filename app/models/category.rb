class Category < ActiveRecord::Base
  has_many :products
  CATEGORIES = ["Folders", "Holders&Displays", "Storage", "MoreSupplies", "Albums", "Tubes"]

  def has_products?
    if self.has_children? || self.products.length > 0
      return true
    else
      return false
    end
  end

  def just_straight_up_products
    if self.products.length > 0
      return true
    else
      return false
    end
  end

  def product_check

  end


  def has_children?
    if self.children_categories.length > 0
      return true
    else
      return false
    end
  end

  def categories_with_products
    @appropro_categories = []
    Category.all.each do |category|
      if category.just_straight_up_products
        @appropro_categories << category
      end
    end
    return @appropro_categories
  end

  def children_categories
    categories = Category.where("parent_key = ?", self.category_key)
    return categories
  end
  #THIS DOESN'T WORK. NEED TO HARD CORE VARIABLE THOSE IN
  scope :folders, -> { where('parent_key = ?', "Folders") }
end
