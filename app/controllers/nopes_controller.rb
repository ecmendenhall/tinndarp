class NopesController < ApplicationController

  def index
    user_id = params[:user_id].to_i
    nopes = MemoryRepository.nope.by_user(user_id)
    render json: nopes.map(&:attributes)
  end

  def create
    user_id = params[:user_id].to_i
    product_id = params[:product_id].to_i
    nope = MemoryRepository.nope.create(
      user_id: user_id,
      product_id: product_id
    )
    redirect_to root_path
  end

end
