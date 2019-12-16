class Member < ApplicationRecord
  include DestroyRecord

  #scope
  scope :random, -> { order('RAND()') }

  #Validation
  validates :name, presence: true
  validates :contact_number, presence: true, uniqueness: { scope: :is_deleted }
  validates_length_of :name, minimum: 3, maximum: 50
  validates_length_of :contact_number, minimum: 11, maximum: 30

  #Methods
  def self.get_member member_id
    member = Member.find_by(id: member_id)
  end

  def self.update_won_count winner, winner_score, looser, looser_score
    winner_member = Member.get_member(winner)
    winner_member.update_attributes(
      won_matches: winner_member.won_matches+1, 
      total_score: winner_member.total_score+winner_score
      ) if winner_member.present?

    looser_member = Member.get_member(looser)
    looser_member.update_attributes(
      lost_matches: looser_member.lost_matches+1, 
      total_score: looser_member.total_score+looser_score 
      ) if looser_member.present?
  end

  def self.update_avg_score member_id
    member = Member.get_member(member_id)
    avg_score = member.total_score/(member.lost_matches+member.won_matches)
    member.update_attributes(avg_score: avg_score)
  end

  def self.update_highest_score member_id, highest_score, match_id
    member = Member.get_member(member_id)

    #member highest score is less then recent match score then update highest score
    if member.highest_score < highest_score
      member.update_attributes(highest_score: highest_score, highest_scored_match_id: match_id)
    end
  end
end
