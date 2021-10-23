require 'rails_helper'

RSpec.describe Card, type: :model do
  
  it "is the 8 of clubs" do
    
    card = Card.new
    card.memory_import( "8C", Hand.new )
    expect(card.suit).to eq "clubs"
    expect(card.numeric_value).to eq 8
  end

  it "is the 10 of spades" do
    
    card = Card.new
    card.memory_import( "TS", Hand.new )
    expect(card.suit).to eq "spades"
    expect(card.numeric_value).to eq 10
  end

  it "is the King of clubs" do
    
    card = Card.new
    card.memory_import( "KC", Hand.new )
    expect(card.suit).to eq "clubs"
    expect(card.numeric_value).to eq 13
  end

  it "is the nine of hearts" do 
    card = Card.new
    card.memory_import( "9H", Hand.new )
    expect(card.suit).to eq "hearts"
    expect(card.numeric_value).to eq 9
  end

end
