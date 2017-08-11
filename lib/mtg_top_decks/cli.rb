class CommandLine

  def call
    puts "welcome to MtG: Top Decks. Please type a number of a metagame to view recent winning decklists: Type 'exit' to quit."
    puts "1. Standard"
    puts "2. Modern"
    puts "3. Legacy"
    input = gets.chomp
    if input.to_i == 1
      puts "Please select a date:"
      #MetagameScraper.new.standard_scraper
      #input2 = gets.chomp
      #Events.new(input2.to_i).standard_events
      Decks.new.show_decklist
    elsif input.to_i == 2
      puts "Please select a date:"
      MetagameScraper.new.modern_scraper
      input2 = gets.chomp
      Events.new(input2.to_i).modern_events
    elsif input.to_i == 3
      puts "Please select a date:"
      MetagameScraper.new.legacy_scraper
      input2 = gets.chomp
      Events.new(input2.to_i).legacy_events
    elsif input == "exit"
      puts "Thank you for using MtG: Top Decks!"
    else
      puts "Please enter a valid input."
      self.call
    end
  end


end
