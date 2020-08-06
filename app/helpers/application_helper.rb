module ApplicationHelper

  def full_title(page_title = "")
    base_title = "Market Deal"

    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def logged_in?
    current_user.present?
  end

  def admin?
    current_user.admin
  end
    
  def user_count
    User.count
  end

  def product_count
    Product.count
  end
  
  def category_count
    Category.count
  end
  
  def order_count
    Order.count
  end
  
  def address_count
    Address.count
  end
end
