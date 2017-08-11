class Decks
  attr_accessor :deck_selected

def initialize
  @array_of_deck_urls = []
end

 def show_decklist
  standard = Nokogiri::HTML(open("https://www.mtggoldfish.com/metagame/standard"))
  standardevent = Nokogiri::HTML(open("https://www.mtggoldfish.com#{standard.css(".decks-sidebar h4 a")[1]["href"]}"))
  standardevent.css(".tournament-decklist-odd  td a").each do |url|
      @array_of_deck_urls << url["href"]
   end
  standardevent.css(".tournament-decklist-event  td a").each do |url|
      @array_of_deck_urls << url["href"]
  end
  @array_of_deck_urls
  currentdeckselection = Nokogiri::HTML(open("https://www.mtggoldfish.com#{@array_of_deck_urls[0]}"))

  deckformat = currentdeckselection.css(".deck-col-qty,.deck-col-card").collect do |card|
      card.text.strip
   end


  counter = 0
  while counter < deckformat.length
    puts "#{deckformat[counter]} #{deckformat[counter + 1]}"
    counter += 2
  end


 end



end
