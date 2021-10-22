require 'rails_helper'

RSpec.describe Card, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  it "is the 8 of clubs" do
    
    #"8C TS KC 9H 4S 7D 2S 5D 3S AC"
    card = Card.new
    card.memory_import( "8C", Hand.new )
    expect(card.suit).to eq "clubs"
    expect(card.value).to eq 8
    expect(card.numeric_value).to eq 8
  end

  it "is the 10 of spades" do
    
    #"8C TS KC 9H 4S 7D 2S 5D 3S AC"
    card = Card.new
    card.memory_import( "TS", Hand.new )
    expect(card.suit).to eq "spades"
    # expect(card.value).to eq 10
    expect(card.numeric_value).to eq 10
  end

  it "is the King of clubs" do
    
    #"8C TS KC 9H 4S 7D 2S 5D 3S AC"
    card = Card.new
    card.memory_import( "KC", Hand.new )
    expect(card.suit).to eq "clubs"
    # expect(card.value).to eq 13
    expect(card.numeric_value).to eq 13
  end

  it "is the nine of hearts" do
    
    #"8C TS KC 9H 4S 7D 2S 5D 3S AC"
    card = Card.new
    card.memory_import( "9H", Hand.new )
    expect(card.suit).to eq "hearts"
    # expect(card.value).to eq 9
    expect(card.numeric_value).to eq 9
  end

end
