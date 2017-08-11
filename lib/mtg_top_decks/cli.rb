class CommandLine

  def call
    puts "welcome to MtG: Top Decks. Please type a number of a metagame to view recent winning decklists: Type 'exit' to quit."
    puts "1. Standard"
    puts "2. Modern"
    puts "3. Legacy"
    input = gets.chomp
    if input.to_i == 1
      puts "Please select an event:"
      MetagameScraper.new.standard_scraper
      input2 = gets.chomp
      puts "Please select a deck to see the decklist:"
      Events.new(input2.to_i).standard_events
      input3 = gets.chomp
      Decks.new(input3.to_i, input2.to_i).show_decklist_standard
    elsif input.to_i == 2
      puts "Please select a event:"
      MetagameScraper.new.modern_scraper
      input2 = gets.chomp
      puts "Please select a deck to see the decklist:"
      Events.new(input2.to_i).modern_events
      input3 = gets.chomp
      Decks.new(input3.to_i, input2.to_i).show_decklist_modern
    elsif input.to_i == 3
      puts "Please select a event:"
      MetagameScraper.new.legacy_scraper
      input2 = gets.chomp
      puts "Please select a deck to see the decklist:"
      Events.new(input2.to_i).legacy_events
      input3 = gets.chomp
      Decks.new(input3.to_i, input2.to_i).show_decklist_legacy
    elsif input == "exit"
      puts "Thank you for using MtG: Top Decks!"
    else
      puts "Please enter a valid input."
      self.call
    end
    puts "Would you like to view more decks?(y/n)"
    input = gets.chomp
    if input == "y"
      self.call
    elsif input == "n"
      puts "Thank you for using MtG: Top Decks!"
    else
      puts "You can't seem to make up your mind! We will start over for you!"
      self.call
    end
  end
 end
