class MatchesController < ApplicationController
  def top_players
  	@members = Member.group(:id).having("sum(won_matches+lost_matches) > 1").order(" avg_score DESC ").limit(10)
  end
end