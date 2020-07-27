module ProductsHelper
  def total_products
    Product.count
  end
end
