class Match < ApplicationRecord
  include DestroyRecord
  after_save :update_member_score

  JSON_LIST = [ :id, :player1, :player2, :score_player1, :score_player2, :created_at, :location]

  #Validation
  validates :player1, :player2, presence: true

  #Methods
  def self.get_match(match_id)
    match_info =  Match.find_by(id: match_id)
  end

  def update_member_score
  	#update won and loss count 
  	if score_player1 > score_player2
  	  Member.update_won_count(player1, score_player1, player2, score_player2)
  	else
      Member.update_won_count(player2, score_player2, player1, score_player1)
  	end

  	#Update avg and highest score of player1
  	Member.update_avg_score(player1)
  	Member.update_highest_score(player1, score_player1, id)

  	#Update avg and highest score of player2
  	Member.update_avg_score(player2)
  	Member.update_highest_score(player2, score_player2, id)
  end

  def as_json(option={})
    json = super(option)
    if player1 == option[:current_player_id]
      against_whom_id     = player2
    else
      against_whom_id     = player1
    end

    json[:against_whom] = Member.get_member(against_whom_id).name
    json
  end

end
