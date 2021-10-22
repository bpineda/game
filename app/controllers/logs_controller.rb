class LogsController < ApplicationController
  def index
    card = GameEngine::Card.new 
    @card = card
  end
end
