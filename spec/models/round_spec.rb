require 'rails_helper'

RSpec.describe Round, type: :model do
  it "has winner with the first" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "spades", value: 2, numeric_value: 2)
    hand_high.cards << Card.new(suit: "clubs", value: 4, numeric_value: 4)
    hand_high.cards << Card.new(suit: "diams", value: 6, numeric_value: 6)
    hand_high.cards << Card.new(suit: "hearts", value: 8, numeric_value: 8)
    hand_high.cards << Card.new(suit: "hearts", value: 3, numeric_value: 3)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "spades", value: 2, numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "clubs", value: 4, numeric_value: 4)
    second_hand_high.cards << Card.new(suit: "diams", value: 6, numeric_value: 6)
    second_hand_high.cards << Card.new(suit: "hearts", value: 7, numeric_value: 7)
    second_hand_high.cards << Card.new(suit: "hearts", value: 3, numeric_value: 3)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 0

    # expect(hand_high.getRankValue).to eq 0

    # expect(hand.getRank).to eq "Three of a Kind"
    # expect(hand.getRankValue).to eq 300
  end
end
