class HomeController < ApplicationController
  def index

    @data = GameEngine::DataMapper.memory_import

    @round = @data[:rounds]
  end
end
