require 'rails_helper'

RSpec.describe Hand, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "has one pair" do
    
    round = Round.new
    hand = Hand.new
    hand.round = round
    hand.cards << Card.new(suit: "spades", numeric_value: 5)
    hand.cards << Card.new(suit: "spades", numeric_value: 6)
    hand.cards << Card.new(suit: "spades", numeric_value: 8)
    hand.cards << Card.new(suit: "spades", numeric_value: 9)
    hand.cards << Card.new(suit: "clubs", numeric_value: 9)

    expect(hand.getRank).to eq "One pair"
    expect(hand.getRankValue).to eq 100
  end

  it "has two pairs" do
    
    round = Round.new
    hand = Hand.new
    hand.round = round
    hand.cards << Card.new(suit: "spades", numeric_value: 5)
    hand.cards << Card.new(suit: "hearts", numeric_value: 8)
    hand.cards << Card.new(suit: "spades", numeric_value: 8)
    hand.cards << Card.new(suit: "spades", numeric_value: 9)
    hand.cards << Card.new(suit: "clubs", numeric_value: 9)

    expect(hand.getRank).to eq "Two pairs"
    expect(hand.getRankValue).to eq 200
  end


  it "is a straight" do
    
    round = Round.new
    hand = Hand.new
    hand.round = round
    hand.cards << Card.new(suit: "hearts", numeric_value: 6)
    hand.cards << Card.new(suit: "hearts", numeric_value: 4)
    hand.cards << Card.new(suit: "clubs", numeric_value: 5)
    hand.cards << Card.new(suit: "hearts", numeric_value: 3)
    hand.cards << Card.new(suit: "hearts", numeric_value: 2)

    expect(hand.getRank).to eq "Straight"
    expect(hand.getRankValue).to eq 400
  end

  it "is not straight flush" do
    
    round = Round.new
    hand = Hand.new
    hand.round = round
    hand.cards << Card.new(suit: "hearts", numeric_value: 6)
    hand.cards << Card.new(suit: "hearts", numeric_value: 2)
    hand.cards << Card.new(suit: "hearts", numeric_value: 8)
    hand.cards << Card.new(suit: "hearts", numeric_value: 13)
    hand.cards << Card.new(suit: "hearts", numeric_value: 4)

    expect(hand.getRank).to eq "Flush"
    expect(hand.getRankValue).to eq 500
  end

  it "is not royal flush" do
    
    round = Round.new
    hand = Hand.new
    hand.round = round
    hand.cards << Card.new(suit: "clubs", numeric_value: 6)
    hand.cards << Card.new(suit: "clubs", numeric_value: 4)
    hand.cards << Card.new(suit: "clubs", numeric_value: 5)
    hand.cards << Card.new(suit: "clubs", numeric_value: 3)
    hand.cards << Card.new(suit: "clubs", numeric_value: 2)

    expect(hand.getRank).to eq "Straight Flush"
    expect(hand.getRankValue).to eq 800
  end

  it "is royal flush" do
    
    round = Round.new
    hand = Hand.new
    hand.round = round
    hand.cards << Card.new(suit: "clubs", numeric_value: 1)
    hand.cards << Card.new(suit: "clubs", numeric_value: 13)
    hand.cards << Card.new(suit: "clubs", numeric_value: 12)
    hand.cards << Card.new(suit: "clubs", numeric_value: 10)
    hand.cards << Card.new(suit: "clubs", numeric_value: 11)

    expect(hand.getRank).to eq "Royal Flush"
    expect(hand.getRankValue).to eq 900
  end

  it "has four of a kind" do
    
    round = Round.new
    hand = Hand.new
    hand.round = round
    hand.cards << Card.new(suit: "spades", numeric_value: 2)
    hand.cards << Card.new(suit: "clubs", numeric_value: 2)
    hand.cards << Card.new(suit: "diams", numeric_value: 2)
    hand.cards << Card.new(suit: "hearts", numeric_value: 2)
    hand.cards << Card.new(suit: "hearts", numeric_value: 3)

    expect(hand.getRank).to eq "Four of a Kind"
    expect(hand.getRankValue).to eq 700
  end

  it "has three of a kind" do
    
    round = Round.new
    hand = Hand.new
    hand.round = round
    hand.cards << Card.new(suit: "spades", numeric_value: 2)
    hand.cards << Card.new(suit: "clubs", numeric_value: 2)
    hand.cards << Card.new(suit: "diams", numeric_value: 2)
    hand.cards << Card.new(suit: "hearts", numeric_value: 4)
    hand.cards << Card.new(suit: "hearts", numeric_value: 3)

    expect(hand.getRank).to eq "Three of a Kind"
    expect(hand.getRankValue).to eq 300
  end

  it "has a full house" do
    
    round = Round.new
    hand = Hand.new
    hand.round = round
    hand.cards << Card.new(suit: "spades", numeric_value: 2)
    hand.cards << Card.new(suit: "clubs", numeric_value: 2)
    hand.cards << Card.new(suit: "diams", numeric_value: 2)
    hand.cards << Card.new(suit: "hearts", numeric_value: 3)
    hand.cards << Card.new(suit: "hearts", numeric_value: 3)

    expect(hand.getRank).to eq "Full House"
    expect(hand.getRankValue).to eq 600
  end

  it "has a high number" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    hand_high.cards << Card.new(suit: "clubs", numeric_value: 4)
    hand_high.cards << Card.new(suit: "diams", numeric_value: 6)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 8)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 3)

    expect(hand_high.getRank).to eq "High number"
    expect(hand_high.getRankValue).to eq 0
  end

end
