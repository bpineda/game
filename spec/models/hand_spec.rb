require 'rails_helper'

RSpec.describe Hand, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "has one pair" do
    
    round = Round.new
    hand = Hand.new
    hand.round = round
    hand.cards << Card.new(suit: "spades", value: 5, numeric_value: 5)
    hand.cards << Card.new(suit: "spades", value: 6, numeric_value: 6)
    hand.cards << Card.new(suit: "spades", value: 8, numeric_value: 8)
    hand.cards << Card.new(suit: "spades", value: 9, numeric_value: 9)
    hand.cards << Card.new(suit: "clubs", value: 9, numeric_value: 9)

    expect(hand.getRank).to eq "One pair"
  end

  it "has two pairs" do
    
    round = Round.new
    hand = Hand.new
    hand.round = round
    hand.cards << Card.new(suit: "spades", value: 5, numeric_value: 5)
    hand.cards << Card.new(suit: "hearts", value: 8, numeric_value: 8)
    hand.cards << Card.new(suit: "spades", value: 8, numeric_value: 8)
    hand.cards << Card.new(suit: "spades", value: 9, numeric_value: 9)
    hand.cards << Card.new(suit: "clubs", value: 9, numeric_value: 9)

    expect(hand.getRank).to eq "Two pairs"
  end


  it "is a straight" do
    
    round = Round.new
    hand = Hand.new
    hand.round = round
    hand.cards << Card.new(suit: "hearts", value: 6, numeric_value: 6)
    hand.cards << Card.new(suit: "hearts", value: 4, numeric_value: 4)
    hand.cards << Card.new(suit: "clubs", value: 5, numeric_value: 5)
    hand.cards << Card.new(suit: "hearts", value: 3, numeric_value: 3)
    hand.cards << Card.new(suit: "hearts", value: 2, numeric_value: 2)

    expect(hand.getRank).to eq "Straight"
  end

  it "is not straight flush" do
    
    round = Round.new
    hand = Hand.new
    hand.round = round
    hand.cards << Card.new(suit: "hearts", value: 6, numeric_value: 6)
    hand.cards << Card.new(suit: "hearts", value: 2, numeric_value: 2)
    hand.cards << Card.new(suit: "hearts", value: 8, numeric_value: 8)
    hand.cards << Card.new(suit: "hearts", value: 13, numeric_value: 13)
    hand.cards << Card.new(suit: "hearts", value: 4, numeric_value: 4)

    expect(hand.getRank).to eq "Flush"
  end

  it "is not royal flush" do
    
    round = Round.new
    hand = Hand.new
    hand.round = round
    hand.cards << Card.new(suit: "clubs", value: 6, numeric_value: 6)
    hand.cards << Card.new(suit: "clubs", value: 4, numeric_value: 4)
    hand.cards << Card.new(suit: "clubs", value: 5, numeric_value: 5)
    hand.cards << Card.new(suit: "clubs", value: 3, numeric_value: 3)
    hand.cards << Card.new(suit: "clubs", value: 2, numeric_value: 2)

    expect(hand.getRank).to eq "Straight Flush"
  end

  it "is royal flush" do
    
    round = Round.new
    hand = Hand.new
    hand.round = round
    hand.cards << Card.new(suit: "clubs", value: 1, numeric_value: 1)
    hand.cards << Card.new(suit: "clubs", value: 13, numeric_value: 13)
    hand.cards << Card.new(suit: "clubs", value: 12, numeric_value: 12)
    hand.cards << Card.new(suit: "clubs", value: 10, numeric_value: 10)
    hand.cards << Card.new(suit: "clubs", value: 11, numeric_value: 11)

    expect(hand.getRank).to eq "Royal Flush"
  end

  it "has four of a kind" do
    
    round = Round.new
    hand = Hand.new
    hand.round = round
    hand.cards << Card.new(suit: "spades", value: 2, numeric_value: 2)
    hand.cards << Card.new(suit: "clubs", value: 2, numeric_value: 2)
    hand.cards << Card.new(suit: "diams", value: 2, numeric_value: 2)
    hand.cards << Card.new(suit: "hearts", value: 2, numeric_value: 2)
    hand.cards << Card.new(suit: "hearts", value: 3, numeric_value: 3)

    expect(hand.getRank).to eq "Four of a Kind"
  end

  it "has three of a kind" do
    
    round = Round.new
    hand = Hand.new
    hand.round = round
    hand.cards << Card.new(suit: "spades", value: 2, numeric_value: 2)
    hand.cards << Card.new(suit: "clubs", value: 2, numeric_value: 2)
    hand.cards << Card.new(suit: "diams", value: 2, numeric_value: 2)
    hand.cards << Card.new(suit: "hearts", value: 4, numeric_value: 4)
    hand.cards << Card.new(suit: "hearts", value: 3, numeric_value: 3)

    expect(hand.getRank).to eq "Three of a Kind"
  end

  it "has a full house" do
    
    round = Round.new
    hand = Hand.new
    hand.round = round
    hand.cards << Card.new(suit: "spades", value: 2, numeric_value: 2)
    hand.cards << Card.new(suit: "clubs", value: 2, numeric_value: 2)
    hand.cards << Card.new(suit: "diams", value: 2, numeric_value: 2)
    hand.cards << Card.new(suit: "hearts", value: 3, numeric_value: 3)
    hand.cards << Card.new(suit: "hearts", value: 3, numeric_value: 3)

    expect(hand.getRank).to eq "Full House"
  end

  it "has a high number" do
    
    round = Round.new
    hand = Hand.new
    hand.round = round
    hand.cards << Card.new(suit: "spades", value: 2, numeric_value: 2)
    hand.cards << Card.new(suit: "clubs", value: 4, numeric_value: 4)
    hand.cards << Card.new(suit: "diams", value: 6, numeric_value: 6)
    hand.cards << Card.new(suit: "hearts", value: 8, numeric_value: 8)
    hand.cards << Card.new(suit: "hearts", value: 3, numeric_value: 3)

    expect(hand.getRank).to eq "High number"
  end

end
