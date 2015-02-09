require 'memory_repository/memory_repository'
require 'matches/finder'

class TinndarpController < ApplicationController

  def index
    @product = random_product
    @liked_products = liked_products_for(1).last(5)
    @noped_products = noped_products_for(1).last(5)
    @matched_products = matched_products_for(1, 2)
    @current_user = current_user
    @matched_user = matched_user
    @users = users
  end

  def likes
    @liked_products = liked_products_for(1)
  end

  def nopes
    @noped_products = noped_products_for(1)
  end

  def matches
    @matched_products = matched_products_for(1, 2)
    @current_user = current_user
    @matched_user = matched_user
    @users = users
  end

  private

  def product_repo
    @product_repo ||= MemoryRepository.product
  end

  def user_repo
    @user_repo ||= MemoryRepository.user
  end

  def random_product
    product_repo.sample
  end

  def likes_for(user_id)
    MemoryRepository.like.by_user(user_id)
  end

  def nopes_for(user_id)
    MemoryRepository.nope.by_user(user_id)
  end

  def liked_products_for(user_id)
    likes_for(user_id).map {|like| product_repo.find(like.product_id) }
  end

  def noped_products_for(user_id)
    nopes_for(user_id).map {|nope| product_repo.find(nope.product_id) }
  end

  def matches_for(user_id, match_id)
    Matches::Finder.for_users(user_id, match_id)
  end

  def matched_products_for(user_id, match_id)
    matches_for(user_id, match_id).map {|id| product_repo.find(id) }
  end

  def current_user
    user_repo.find(1)
  end

  def matched_user
    user_repo.find(2)
  end

  def users
    user_repo.all
  end

end
