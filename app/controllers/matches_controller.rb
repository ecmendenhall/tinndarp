require 'matches/finder'

class MatchesController < ApplicationController

  def index
    user_id  = params[:user_id].to_i
    match_id = params[:match_id].to_i
    likes = Matches::Finder.for_users(user_id, match_id)
    render json: {product_ids: likes}
  end

end
