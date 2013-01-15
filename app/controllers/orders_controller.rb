class OrdersController < ApplicationController
  before_filter :require_user
  
  def index
    @orders = Order.all
  end
end
