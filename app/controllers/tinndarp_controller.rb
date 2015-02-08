require 'memory_repository/memory_repository'
require 'matches/finder'

class TinndarpController < ApplicationController

  def index
    product_repo = MemoryRepository.product
    @product = product_repo.sample

    likes = MemoryRepository.like.by_user(1)
    @liked_products = likes.map do |like|
      product_repo.find(like.product_id)
    end.last(5)

    nopes = MemoryRepository.nope.by_user(1)
    @noped_products = nopes.map do |nope|
      product_repo.find(nope.product_id)
    end.last(5)

    matches = Matches::Finder.for_users(1, 2)
    @matched_products = matches.map do |id|
      product_repo.find(id)
    end

    @current_user = MemoryRepository.user.find(1)
    @matched_user = MemoryRepository.user.find(2)
    @users = MemoryRepository.user.all
  end

end
