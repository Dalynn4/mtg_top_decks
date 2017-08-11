class MetagameScraper



def standard_scraper
  standard = Nokogiri::HTML(open("https://www.mtggoldfish.com/metagame/standard"))
  counter = 1
  standard.css(".decks-sidebar h4").each do |event|
    puts "#{counter}. #{event.text.strip}"
    counter += 1
   end
 end

def modern_scraper
  modern = Nokogiri::HTML(open("https://www.mtggoldfish.com/metagame/modern"))
  counter = 1
  modern.css(".decks-sidebar h4").each do |event|
    puts "#{counter}. #{event.text.strip}"
    counter += 1
   end
 end

def legacy_scraper
  legacy = Nokogiri::HTML(open("https://www.mtggoldfish.com/metagame/legacy"))
  counter = 1
  legacy.css(".decks-sidebar h4").each do |event|
    puts "#{counter}. #{event.text.strip}"
    counter += 1
    end
  end
end
