class Hand < ApplicationRecord
  has_many :cards
  belongs_to :round
  @@rank_value = 0
  
  def getRank
    @@rank_value = 0
    if is_royal_flush?
      @@rank_value = 900
      return "Royal Flush"
    end

    if is_straight_flush?
      @@rank_value = 800
      return "Straight Flush" 
    end
    
    if has_four_of_a_kind?
      @@rank_value = 700
      return "Four of a Kind"
    end
    
    if is_full_house?
      @@rank_value = 600
      return "Full House" 
    end
    
    if is_flush?
      @@rank_value = 500
      return "Flush" 
    end
    
    if is_straight?
      @@rank_value = 400
      return "Straight" 
    end
    
    if has_three_of_a_kind?
      @@rank_value = 300
      return "Three of a Kind" 
    end
    
    if has_two_pairs?
      @@rank_value = 200
      return "Two pairs"
    end

    if has_one_pair?
      @@rank_value = 100
      return "One pair" 
    end
    @@rank_value = getHighValue
    "High number"
  end

  def getHighValue
    arr_values = get_numeric_values_array
    arr_values.sort!
    # puts arr_values.inspect
    arr_values.pop
  end

  def getSortedArray
    arr_values = get_numeric_values_array
    arr_values.sort!
  end

  def getpairValues
      # a = [1,2,2,3,4]
      # b = []
      # a.uniq.each { |i| b.push(i) if a.count(i) == 2 }
      # b.sort
      arr_values = get_numeric_values_array
      arr_pairs = []
      arr_values.uniq.each { |i| arr_pairs.push(i) if arr_values.count(i) == 2 }
      [ arr_pairs.sort.reverse[0] ]
  end

  def getRankValue
    return @@rank_value
  end

  def has_one_pair?
    arr_values = get_numeric_values_array
    arr_values.uniq.size == 4
  end


  def has_two_pairs?
    # puts "-"*100
    arr_values = get_numeric_values_array
    arr_values.uniq.size == 3
  end

  def has_two_of_a_kind?
    
    arr_values = get_numeric_values_array
    arr_values.any? { |y| arr_values.count(y) == 2 }
    
  end

  def has_three_of_a_kind?

    arr_values = get_numeric_values_array
    # puts arr_values.inspect
    arr_values.any? { |y| arr_values.count(y) == 3 }
    
  end

  def has_four_of_a_kind?
    
    arr_values = get_numeric_values_array
    arr_values.any? { |y| arr_values.count(y) == 4 }
    
  end

  def is_full_house?
    has_two_of_a_kind? && has_three_of_a_kind?
  end

  def is_straight?
    # return false
    arr_values = get_numeric_values_array
    # puts arr_values.inspect
    arr_values.sort!
    # arr_values.reverse!
    # puts arr_values.inspect
    n = 0

    # puts ((arr_values[4] - arr_values[3]))
    # puts ((arr_values[4] - arr_values[3]) == 1)


    # return false if ((arr_values[4] - arr_values[3]) != 1)
    # return false if true

    # puts "-"*100
    # if ((arr_values[4] - arr_values[3]) == 1)
    #   return false
    # end

    if arr_values.include?(1)
      return true if arr_values.include?(2) && arr_values.include?(3) && arr_values.include?(4) && arr_values.include?(5)
      return true if arr_values.include?(10) && arr_values.include?(11) && arr_values.include?(12) && arr_values.include?(13)
    end

    return false if ((arr_values[4] - arr_values[3]) != 1)
    return false if (arr_values[3] - arr_values[2]) != 1
    return false if (arr_values[2] - arr_values[1]) != 1
    return false if (arr_values[1] - arr_values[0]) != 1

    # for i in arr_values do 
    #   # puts n.to_s + " " + i.to_s
    #   # puts arr_values[n]
    #   # puts arr_values[n-1]
    #   # puts (arr_values[n] - arr_values[n-1])
    #   # puts "-"*100
    #   if n != 0
    #     puts "Different than zero"
    #     puts "Operation Value"
    #     puts (arr_values[n] - arr_values[n-1])
    #     return false if (arr_values[n] - arr_values[n-1]) == 0
    #   else
    #     puts "equal to zero"
    #   end
    #   n = n + 1
    #   end  
    # end
    # true
    true
  end

  def is_flush?
    return has_same_suit?
  end

  def is_royal_flush?

    return false unless has_same_suit?

    # arr_values = []

    # self.cards.each do | card |
    #   # puts card.value
    #   # puts card.numeric_value
    #   arr_values.push card.numeric_value
    # end
    arr_values = get_numeric_values_array

    # puts arr_values.inspect
    return false unless arr_values.include?(10)
    return false unless arr_values.include?(11)
    return false unless arr_values.include?(12)
    return false unless arr_values.include?(13)
    return false unless arr_values.include?(1)

    true
  end


  def is_straight_flush?
    return false unless has_same_suit?
    arr_values = get_numeric_values_array
    
    # in case it has an ace
    if arr_values.include?(1)
      return true if arr_values.include?(2) && arr_values.include?(3) && arr_values.include?(4) && arr_values.include?(5)
      return true if arr_values.include?(10) && arr_values.include?(11) && arr_values.include?(12) && arr_values.include?(13)
    else

      arr_values.sort!

      return false if ((arr_values[4] - arr_values[3]) != 1)
      return false if (arr_values[3] - arr_values[2]) != 1
      return false if (arr_values[2] - arr_values[1]) != 1
      return false if (arr_values[1] - arr_values[0]) != 1

      # arr_values.reverse!
      # n = 0
      # for i in arr_values do 
      #   if n != 0
      #     return false if arr_values[n] - arr_values[n-1] == 0
      #   end
      #     n = n + 1
      #   # end  
      # end
      # true
    end
    true
  end


  def has_same_suit?
    return false unless (self.cards[0].suit == self.cards[1].suit && self.cards[0].suit == self.cards[2].suit && self.cards[0].suit == self.cards[3].suit && self.cards[0].suit == self.cards[4].suit  )
    true
  end

  def get_numeric_values_array
    arr_values = []
    self.cards.each do | card |
      arr_values.push card.numeric_value
    end
    arr_values
  end

end
