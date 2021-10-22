class Card < ApplicationRecord
  belongs_to :hand
  def import( raw_data, hand )
    self.value = raw_data[0]

    # numeric_value = raw_data[0]
    case raw_data[0]

    when 'T'
      numeric_value = 10
    when 'J'
      numeric_value = 11
    when 'Q'
      numeric_value = 12
    when 'K'
      numeric_value = 13
    when 'A'
      numeric_value = 1
    else
      numeric_value = raw_data[0]
    end

    self.numeric_value = numeric_value

    case raw_data[1]

    when 'C'
      suit = 'clubs'
    when 'S'
      suit = 'spades'
    when 'H'
      suit = 'hearts'
    when 'D'
      suit = 'diams'
    else
    end
    

    self.suit = suit
    self.hand = hand
    self.save
  end

  def memory_import( raw_data, hand )
    self.value = raw_data[0]

    # numeric_value = raw_data[0]
    case raw_data[0]

    when 'T'
      numeric_value = 10
    when 'J'
      numeric_value = 11
    when 'Q'
      numeric_value = 12
    when 'K'
      numeric_value = 13
    when 'A'
      numeric_value = 1
    else
      numeric_value = raw_data[0]
    end

    self.numeric_value = numeric_value

    case raw_data[1]

    when 'C'
      suit = 'clubs'
    when 'S'
      suit = 'spades'
    when 'H'
      suit = 'hearts'
    when 'D'
      suit = 'diams'
    else
    end
    

    self.suit = suit
    self.hand = hand
    self
  end


  def viewable_value
    # return self.numeric_value if self.numeric_value < 11
    case self.numeric_value
    when 11
      return 'j'
    when 12
      return 'q'
    when 13
      return 'k'
    else
      return self.numeric_value
    end
  end

end
