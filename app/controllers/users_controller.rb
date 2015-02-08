class UsersController < ApplicationController

  def index
    users = MemoryRepository.user.all
    render json: users.map(&:attributes)
  end

  def show
    user = MemoryRepository.user.find(params[:id].to_i)
    render json: user.attributes
  end

end
