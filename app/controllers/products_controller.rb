class ProductsController < ApplicationController

  def index
    products = MemoryRepository.product.all
    render json: products.map(&:attributes)
  end

  def show
    product = MemoryRepository.product.find(params[:id].to_i)
    render json: ProductPresenter.new(product)
  end


end
