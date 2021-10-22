class Round < ApplicationRecord
  has_many :hands
  attr_accessor :index
  def getWinner
  end
end
