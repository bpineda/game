class Round < ApplicationRecord
  has_many :hands
  attr_accessor :index
  def getWinner

    round_meta_data = Hash.new

    round_meta_data['arr_hands'] = []
    round_meta_data['card_numbers'] = []
    round_meta_data['2_of_a_kind'] = []
    round_meta_data['3_of_a_kind'] = []
    round_meta_data['4_of_a_kind'] = []

    first_hand = self.hands.first
    round_meta_data['arr_hands'][0] = self.hands.first
    round_meta_data['arr_hands'][0]['rank'] = round_meta_data['arr_hands'][0].getRank
    first_hand_rank = first_hand.getRank
    first_hand_pairs = first_hand.getpairValues
    first_hand_threes = first_hand.getThreesValues
    first_hand_fours = first_hand.getFoursValues

    round_meta_data['2_of_a_kind'].push first_hand_pairs
    round_meta_data['3_of_a_kind'].push first_hand_threes
    round_meta_data['4_of_a_kind'].push first_hand_fours
    
    first_rank_value = first_hand.getRankValue 
    round_meta_data['card_numbers'].push first_hand.getSortedArray


    ## Second Hand setup

    last_hand = self.hands.last
    last_hand_rank = last_hand.getRank
    last_hand_pairs = last_hand.getpairValues
    last_hand_threes = last_hand.getThreesValues
    last_hand_fours = last_hand.getFoursValues

    round_meta_data['2_of_a_kind'].push last_hand_pairs
    round_meta_data['3_of_a_kind'].push last_hand_threes
    round_meta_data['4_of_a_kind'].push last_hand_fours

    last_rank_value = last_hand.getRankValue 
    round_meta_data['card_numbers'].push last_hand.getSortedArray
    

    return 0 if first_rank_value > last_rank_value
    return 1 if first_rank_value < last_rank_value

    # In case of a tie logic starts here:

    if round_meta_data['arr_hands'][0]['rank'] == "High number"
      return getHighest round_meta_data['card_numbers']
    end

    if round_meta_data['arr_hands'][0]['rank'] == "One pair" || round_meta_data['arr_hands'][0]['rank'] == "Two pairs"
      if round_meta_data['2_of_a_kind'][0] != round_meta_data['2_of_a_kind'][1]
        return getHighest round_meta_data['2_of_a_kind']
      end
      # if the values are the same, according to the rules
      # we go to the next highest number and so on
      return getHighest round_meta_data['card_numbers']
    end

    if round_meta_data['arr_hands'][0]['rank'] == "Three of a Kind"
      if round_meta_data['3_of_a_kind'][0] != round_meta_data['3_of_a_kind'][1]
        return getHighest round_meta_data['3_of_a_kind']
      end
      return getHighest round_meta_data['card_numbers']
    end

    if round_meta_data['arr_hands'][0]['rank'] == "Straight"
      return getHighest round_meta_data['card_numbers']
    end

    if round_meta_data['arr_hands'][0]['rank'] == "Flush"
      return getHighest round_meta_data['card_numbers']
    end

    if round_meta_data['arr_hands'][0]['rank'] == "Full House"
      if round_meta_data['3_of_a_kind'][0] != round_meta_data['3_of_a_kind'][1]
        return getHighest round_meta_data['3_of_a_kind']
      end
      return getHighest round_meta_data['card_numbers']
    end

    if round_meta_data['arr_hands'][0]['rank'] == "Four of a Kind"
      if round_meta_data['4_of_a_kind'][0] != round_meta_data['4_of_a_kind'][1]
        return getHighest round_meta_data['4_of_a_kind']
      end
      # TODO: verify if this is a real use case
      return getHighest round_meta_data['card_numbers']
    end

    # TODO: verify how the ace is handled
    if round_meta_data['arr_hands'][0]['rank'] == "Straight Flush"
      return getHighest round_meta_data['card_numbers']
    end

    # TODO: verify if there is a use case for a Royal Flush

  end

  def getHighest sorted_array
    first_player = sorted_array[0].pop
    second_player = sorted_array[1].pop
    getHighest(sorted_array) if (first_player == second_player )
    return 0 if first_player > second_player
    1
  end
end
