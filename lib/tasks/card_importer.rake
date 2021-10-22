namespace :card_importer do
  desc "Imports cards and hands from the text file"
  task import: :environment do
    puts 'Importing Data'
    
    Round.delete_all
    Card.delete_all
    Hand.delete_all

    # n = 0

    File.foreach("poker.txt") do |line| 
      # if n == 0
        # puts line
        GameEngine::DataMapper.import_hand line
      # end
      # n = n + 1 
    end


    # file.close
  end

end
