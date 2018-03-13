class ApplicationController < ActionController::Base
  def index
    Product.all.sample(params[:touch].to_i).each(&:touch)
    @categories = Category.preload(:products)
  end
end
