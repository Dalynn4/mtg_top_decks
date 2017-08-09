class CommandLine

  def call
    puts "welcome to MtG: Top Decks. Please type a number of a metagame to view recent winning decklists: Type 'exit' to quit."
    puts "1. Standard"
    puts "2. Modern"
    puts "3. Legacy"
    input = gets.chomp
    if input.to_i == 1
      puts "Please select a date:"
      MetagameScraper.new.standardscraper
    elsif input.to_i == 2
      puts "Please select a date:"
      MetagameScraper.new.modernscraper
    elsif input.to_i == 3
      puts "Please select a date:"
      MetagameScraper.new.legacyscraper
    elsif input == "exit"
      puts "Thank you for using MtG: Top Decks!"
    else
      puts "Please enter a valid input."
      self.call
    end
  end
end
