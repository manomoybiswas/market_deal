class HomeController < ApplicationController
  layout "dashboard", only: [:overview]
  def index
    @products = Product.all
    @cart = Cart.new
  end
  def overview
    @products = Product.all
  end
end
