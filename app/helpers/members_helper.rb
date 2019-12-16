module MembersHelper
  def self.get_match_details match_id, current_player_id
    match_info = Match.get_match(match_id)
    match_info.as_json(only: Match::JSON_LIST, current_player: current_player_id)
  end

  def self.total_match_count(won,lost)
  	won+lost
  end
end
