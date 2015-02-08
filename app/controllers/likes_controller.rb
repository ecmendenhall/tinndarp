class LikesController < ApplicationController

  def index
    user_id = params[:user_id].to_i
    likes = MemoryRepository.like.by_user(user_id)
    render json: likes.map(&:attributes)
  end

  def create
    user_id = params[:user_id].to_i
    product_id = params[:product_id].to_i
    like = MemoryRepository.like.create(
      user_id: user_id,
      product_id: product_id
    )
    render json: like.attributes
  end

end
