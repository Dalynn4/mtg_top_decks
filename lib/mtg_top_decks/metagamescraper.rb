class MetagameScraper
  include Urls
  attr_accessor :standard, :modern, :legacy

def standard_scraper
  standard_url
  counter = 1
  @standard.css(".decks-sidebar h4").each do |event|
    puts "#{counter}. #{event.text.strip}"
    counter += 1
   end
 end

def modern_scraper
  modern_url
  counter = 1
  @modern.css(".decks-sidebar h4").each do |event|
    puts "#{counter}. #{event.text.strip}"
    counter += 1
   end
 end

def legacy_scraper
  legacy_url
  counter = 1
  @legacy.css(".decks-sidebar h4").each do |event|
    puts "#{counter}. #{event.text.strip}"
    counter += 1
    end
  end
end
