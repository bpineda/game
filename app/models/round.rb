class Round < ApplicationRecord
  has_many :hands
  attr_accessor :index
  def getWinner
    first_hand = self.hands.first
    first_hand.getRank
    first_rank_value = first_hand.getRankValue 
    last_hand = self.hands.last
    last_hand.getRank
    last_rank_value = last_hand.getRankValue 
    # puts first_rank_value
    # puts last_rank_value
    return 0 if first_rank_value > last_rank_value
    return 1 if first_rank_value < last_rank_value

    #in case of a tie
  end
end
