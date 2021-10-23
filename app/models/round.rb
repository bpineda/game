class Round < ApplicationRecord
  has_many :hands
  attr_accessor :index
  def getWinner

    arr_numeric_equivalents = []
    arr_numeric_pairs = []
    arr_numeric_threes = []
    first_hand = self.hands.first
    first_hand_rank = first_hand.getRank
    first_hand_pairs = first_hand.getpairValues
    first_hand_threes = first_hand.getThreesValues
    arr_numeric_pairs.push first_hand_pairs
    arr_numeric_threes.push first_hand_threes
    
    first_rank_value = first_hand.getRankValue 
    arr_numeric_equivalents.push first_hand.getSortedArray


    last_hand = self.hands.last
    last_hand_rank = last_hand.getRank
    last_hand_pairs = last_hand.getpairValues
    last_hand_threes = last_hand.getThreesValues
    arr_numeric_pairs.push last_hand_pairs
    arr_numeric_threes.push last_hand_threes
    last_rank_value = last_hand.getRankValue 
    arr_numeric_equivalents.push last_hand.getSortedArray
    

    return 0 if first_rank_value > last_rank_value
    return 1 if first_rank_value < last_rank_value

    # In case of a tie logic starts here:

    if first_hand_rank == "High number"
      return getHighest arr_numeric_equivalents
    end

    if first_hand_rank == "One pair" || first_hand_rank == "Two pairs"
      if arr_numeric_pairs[0] != arr_numeric_pairs[1]
        return getHighest arr_numeric_pairs
      end
      # if the values are the same, according to the rules
      # we go to the next highest number and so on
      return getHighest arr_numeric_equivalents
    end

    if first_hand_rank == "Three of a Kind"
      if arr_numeric_threes[0] != arr_numeric_threes[1]
        return getHighest arr_numeric_threes
      end
      return getHighest arr_numeric_equivalents
    end

    if first_hand_rank == "Straight"
      return getHighest arr_numeric_equivalents
    end

  end

  def getHighest sorted_array
    first_player = sorted_array[0].pop
    second_player = sorted_array[1].pop
    getHighest(sorted_array) if (first_player == second_player )
    return 0 if first_player > second_player
    1
  end
end
