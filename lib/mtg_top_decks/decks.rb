class Decks
  include Urls
  attr_accessor :deck_selected, :event_date_selected, :standard, :standard_event, :modern, :modern_event, :legacy, :legacy_event

def initialize(deck_selected, event_date_selected)
  @deck_selected = (deck_selected * 3) - 3
  @event_date_selected = (event_date_selected * 2) - 1
  @array_of_deck_urls = []
end

 def show_decklist_standard
  standard_url
  standard_event_url

  @standardevent.css(".tournament-decklist-odd  td a").each do |url|
      @array_of_deck_urls << url["href"]
   end
  @standardevent.css(".tournament-decklist-event  td a").each do |url|
      @array_of_deck_urls << url["href"]
  end

  self.list_cards
 end

 def show_decklist_modern
  modern_url
  modern_event_url

  @modernevent.css(".tournament-decklist-odd  td a").each do |url|
      @array_of_deck_urls << url["href"]
   end
  @modernevent.css(".tournament-decklist-event  td a").each do |url|
      @array_of_deck_urls << url["href"]
  end

self.list_cards
end

def show_decklist_legacy
 legacy_url
 legacy_event_url

 @legacyevent.css(".tournament-decklist-odd  td a").each do |url|
     @array_of_deck_urls << url["href"]
  end
 @legacyevent.css(".tournament-decklist-event  td a").each do |url|
     @array_of_deck_urls << url["href"]
 end

 self.list_cards
end

def list_cards
  currentdeckselection = Nokogiri::HTML(open("https://www.mtggoldfish.com#{@array_of_deck_urls[@deck_selected]}"))
  deckformat = currentdeckselection.css(".deck-col-qty,.deck-col-card").collect do |card|
      card.text.strip
   end

  counter = 0
   while counter < deckformat.length
     puts "#{deckformat[counter]} #{deckformat[counter + 1]}"
     counter += 2
   end
  puts "The last 15 cards listed are the sideboard for the deck."
end

  end
