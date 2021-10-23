class HomeController < ApplicationController
  def index

    @data = GameEngine::DataMapper.memory_import

    @round = @data[:rounds]
    @player_wins = @data[:player_wins]
  end
end
