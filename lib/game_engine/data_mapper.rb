module GameEngine
  class DataMapper
    def self.import_hand raw_data
      arr_cards = raw_data.split
      puts arr_cards.inspect
      round = Round.create
      n = 1
      hand = generate_hand(round)
      arr_cards.each do | card |
        hand = generate_hand(round) if n%5 == 1 && n != 1
        import_card card, hand, round
        n = n + 1
      end
    end
    def self.import_card raw_card_value, hand, round
      card = Card.new
      # hand = Hand.create
      puts raw_card_value
      card.import( raw_card_value, hand )
    end

    def self.import_card_in_memory raw_card_value, hand, round
      card = Card.new
      # hand = Hand.create
      # puts raw_card_value
      card.memory_import( raw_card_value, hand )
    end

    def self.generate_hand(round)
      hand = Hand.create
      hand.round = round
      hand
    end

    def self.generate_hand_in_memory(round)
      hand = Hand.new
      hand.round = round
      hand
    end


    def self.bla
      "QWERTYU"
    end

    def self.memory_import
      data = []
      n = 1
      File.foreach("poker.txt") do |raw_data| 

        # if n == 0
        # puts line
        # GameEngine::DataMapper.import_hand line

        if n < 1000

          # arr_cards = raw_data.split
          # # puts arr_cards.inspect
          # round = Round.new
          # n = 1
          # hand = generate_hand_in_memory(round)
          # arr_cards.each do | card |
          #   hand = generate_hand_in_memory(round) if n%5 == 1 && n != 1
          #   import_card_in_memory card, hand, round
          #   n = n + 1
          # end


          puts raw_data.inspect
          arr_cards = raw_data.split


          round = Round.new
          round.index = n
          hand = Hand.new
          hand.round = round
          card1 = Card.new
          card2 = Card.new
          card3 = Card.new
          card4 = Card.new
          card5 = Card.new

          # memory_import( arr_cards[0], hand )

          hand.cards << card1.memory_import( arr_cards[0], hand )
          hand.cards << card2.memory_import( arr_cards[1], hand )
          hand.cards << card3.memory_import( arr_cards[2], hand )
          hand.cards << card4.memory_import( arr_cards[3], hand )
          hand.cards << card5.memory_import( arr_cards[4], hand )
          # hand.cards << Card.new(suit: "spades", value: 5, numeric_value: 5)
          # hand.cards << Card.new(suit: "spades", value: 6, numeric_value: 6)
          # hand.cards << Card.new(suit: "spades", value: 8, numeric_value: 8)
          # hand.cards << Card.new(suit: "spades", value: 9, numeric_value: 9)
          round.hands << hand

          hand = Hand.new
          hand.round = round

          card6 = Card.new
          card7 = Card.new
          card8 = Card.new
          card9 = Card.new
          card10 = Card.new

          hand.cards << card6.memory_import( arr_cards[5], hand )
          hand.cards << card7.memory_import( arr_cards[6], hand )
          hand.cards << card8.memory_import( arr_cards[7], hand )
          hand.cards << card9.memory_import( arr_cards[8], hand )
          hand.cards << card10.memory_import( arr_cards[9], hand )
          # hand.cards << Card.new(suit: "spades", value: 5, numeric_value: 5)
          # hand.cards << Card.new(suit: "spades", value: 6, numeric_value: 6)
          # hand.cards << Card.new(suit: "spades", value: 8, numeric_value: 8)
          # hand.cards << Card.new(suit: "spades", value: 9, numeric_value: 9)
          round.hands << hand

          data.push round

          n = n  + 1

        # hand.getRank
        end


        end
        # n = n + 1 

      # end
      data
    end

  end
end