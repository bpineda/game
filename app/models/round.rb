class Round < ApplicationRecord
  has_many :hands
  attr_accessor :index
  def getWinner

    arr_numeric_equivalents = []
    first_hand = self.hands.first
    first_hand_rank = first_hand.getRank
    
    # puts first_hand.getRankValue

    first_rank_value = first_hand.getRankValue 
    arr_numeric_equivalents.push first_hand.getSortedArray


    last_hand = self.hands.last
    last_hand_rank = last_hand.getRank
    last_rank_value = last_hand.getRankValue 
    arr_numeric_equivalents.push last_hand.getSortedArray
    
    # puts last_hand.getRankValue

    return 0 if first_rank_value > last_rank_value
    return 1 if first_rank_value < last_rank_value

    #in case of a tie
    if first_hand_rank == "High number"
      getHighest arr_numeric_equivalents
    end

  end

  def getHighest sorted_array
    # puts sorted_array.inspect
    # puts sorted_array[0].last
    # puts sorted_array[1].last
    first_player = sorted_array[0].pop
    second_player = sorted_array[0].pop
    getHighest(sorted_array) if (first_player == second_player )
    puts "Last comparison"
    return 0 if first_player == second_player
    1
  end
end
