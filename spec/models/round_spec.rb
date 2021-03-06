require 'rails_helper'

RSpec.describe Round, type: :model do
  it "has winner with the first" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    hand_high.cards << Card.new(suit: "clubs", numeric_value: 4)
    hand_high.cards << Card.new(suit: "diams", numeric_value: 6)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 8)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 3)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 4)
    second_hand_high.cards << Card.new(suit: "diams", numeric_value: 6)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 7)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 3)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 0

  end

  it "has winner with the pair" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    hand_high.cards << Card.new(suit: "clubs", numeric_value: 4)
    hand_high.cards << Card.new(suit: "diams", numeric_value: 6)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 8)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 8)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 4)
    second_hand_high.cards << Card.new(suit: "diams", numeric_value: 6)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 7)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 3)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 0

  end

  it "has winner with two pairs" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    hand_high.cards << Card.new(suit: "clubs", numeric_value: 4)
    hand_high.cards << Card.new(suit: "diams", numeric_value: 6)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 8)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 8)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "diams", numeric_value: 6)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 7)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 7)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 1

  end

  it "has winner with three of a kind" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    hand_high.cards << Card.new(suit: "clubs", numeric_value: 4)
    hand_high.cards << Card.new(suit: "diams", numeric_value: 8)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 8)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 8)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "diams", numeric_value: 6)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 7)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 7)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 0

  end

  it "has winner with straight" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    hand_high.cards << Card.new(suit: "clubs", numeric_value: 4)
    hand_high.cards << Card.new(suit: "diams", numeric_value: 8)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 8)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 8)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 3)
    second_hand_high.cards << Card.new(suit: "diams", numeric_value: 4)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 5)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 6)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 1

  end

  it "has winner with flush" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 4)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 8)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 8)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 8)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 3)
    second_hand_high.cards << Card.new(suit: "diams", numeric_value: 4)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 5)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 6)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 0

  end

  it "has winner with full house" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 4)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 8)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 8)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 8)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "diams", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 5)
    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 5)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 1

  end

  it "has winner with four of a kind" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    hand_high.cards << Card.new(suit: "clubs", numeric_value: 8)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 8)
    hand_high.cards << Card.new(suit: "diams", numeric_value: 8)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 8)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "diams", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 5)
    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 5)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 0

  end

  it "has winner with straight flush" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    hand_high.cards << Card.new(suit: "clubs", numeric_value: 8)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 8)
    hand_high.cards << Card.new(suit: "diams", numeric_value: 8)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 8)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 3)
    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 4)
    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 5)
    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 6)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 1

  end

  it "has winner with royal flush" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 1)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 10)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 11)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 12)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 13)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 3)
    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 4)
    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 5)
    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 6)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 0

  end

  it "has a winner with the highest number" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "spades", numeric_value: 8)
    hand_high.cards << Card.new(suit: "clubs", numeric_value: 7)
    hand_high.cards << Card.new(suit: "diams", numeric_value: 6)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 5)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 2)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 8)
    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 7)
    second_hand_high.cards << Card.new(suit: "diams", numeric_value: 6)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 5)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 3)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 1

  end

  it "has a winner with the highest pair" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "spades", numeric_value: 7)
    hand_high.cards << Card.new(suit: "clubs", numeric_value: 7)
    hand_high.cards << Card.new(suit: "diams", numeric_value: 6)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 5)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 2)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 8)
    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 8)
    second_hand_high.cards << Card.new(suit: "diams", numeric_value: 6)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 5)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 3)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 1

  end

  it "has a winner with the highest number after the pair is tied" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "spades", numeric_value: 4)
    hand_high.cards << Card.new(suit: "clubs", numeric_value: 4)
    hand_high.cards << Card.new(suit: "diams", numeric_value: 8)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 2)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 2)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 4)
    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 4)
    second_hand_high.cards << Card.new(suit: "diams", numeric_value: 7)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 3)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 3)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 0

  end

  it "has winner with three of a kind and a high three of a kind" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    hand_high.cards << Card.new(suit: "clubs", numeric_value: 4)
    hand_high.cards << Card.new(suit: "diams", numeric_value: 8)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 8)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 8)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 3)
    second_hand_high.cards << Card.new(suit: "diams", numeric_value: 7)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 7)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 7)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 0

  end

  it "has winner with three of a kind and a high number" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    hand_high.cards << Card.new(suit: "clubs", numeric_value: 4)
    hand_high.cards << Card.new(suit: "diams", numeric_value: 8)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 8)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 8)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 5)
    second_hand_high.cards << Card.new(suit: "diams", numeric_value: 8)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 8)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 8)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 1

  end

  it "has winner with 2 straight hands" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "spades", numeric_value: 3)
    hand_high.cards << Card.new(suit: "clubs", numeric_value: 4)
    hand_high.cards << Card.new(suit: "diams", numeric_value: 5)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 6)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 7)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 3)
    second_hand_high.cards << Card.new(suit: "diams", numeric_value: 4)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 5)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 6)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 0

  end

  it "has winner with 2 flush hands and a high number" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 4)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 6)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 7)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 8)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 3)
    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 4)
    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 5)
    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 9)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 1

  end

  it "has winner with 2 full house hands and high three of a kind" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 8)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 8)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 8)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "diams", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 5)
    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 5)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 0

  end

  it "has winner with 2 full house hands and high number" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 8)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 8)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 8)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 8)
    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 8)
    second_hand_high.cards << Card.new(suit: "diams", numeric_value: 8)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 5)
    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 5)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 1

  end

  it "has winner with two four of a kind hands and a high four of a kind" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    hand_high.cards << Card.new(suit: "clubs", numeric_value: 8)
    hand_high.cards << Card.new(suit: "hearts", numeric_value: 8)
    hand_high.cards << Card.new(suit: "diams", numeric_value: 8)
    hand_high.cards << Card.new(suit: "spades", numeric_value: 8)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "clubs", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "diams", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "hearts", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 5)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 0

  end

  it "has winner with 2 straight flushes and a high number" do
    
    round = Round.new
    hand_high = Hand.new
    hand_high.round = round
    hand_high.cards << Card.new(suit: "clubs", numeric_value: 3)
    hand_high.cards << Card.new(suit: "clubs", numeric_value: 4)
    hand_high.cards << Card.new(suit: "clubs", numeric_value: 5)
    hand_high.cards << Card.new(suit: "clubs", numeric_value: 6)
    hand_high.cards << Card.new(suit: "clubs", numeric_value: 7)


    second_hand_high = Hand.new
    second_hand_high.round = round

    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 2)
    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 3)
    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 4)
    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 5)
    second_hand_high.cards << Card.new(suit: "spades", numeric_value: 6)

    round.hands << hand_high
    round.hands << second_hand_high


    expect(round.getWinner).to eq 0

  end


end
