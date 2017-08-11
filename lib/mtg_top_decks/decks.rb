class Decks
  include Urls
  attr_accessor :deck_selected, :event_date_selected, :standard, :standard_event, :modern, :modern_event, :legacy, :legacy_event

def initialize(deck_selected, event_date_selected)
  set_deck_selected(deck_selected)
  set_event_date_selected(event_date_selected)
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

 def set_event_date_selected(number)
   if number == 1
     @event_date_selected = 1
   elsif number == 2
     @event_date_selected = 3
   elsif number == 3
     @event_date_selected = 5
   elsif number == 4
     @event_date_selected = 7
   elsif number == 5
     @event_date_selected = 9
   elsif number == 6
     @event_date_selected = 11
   elsif number == 7
     @event_date_selected = 13
   elsif number == 8
     @event_date_selected = 15
   elsif number == 9
     @event_date_selected = 17
   elsif number == 10
     @event_date_selected = 19
   else
     puts "Invalid selection"
   end
 end

 def set_deck_selected(number)
   if number == 1
     @deck_selected = 0
   elsif number == 2
     @deck_selected = 3
   elsif number == 3
     @deck_selected = 6
   elsif number == 4
     @deck_selected = 9
   elsif number == 5
     @deck_selected = 12
   elsif number == 6
     @deck_selected = 15
   elsif number == 7
     @deck_selected = 18
   elsif number == 8
     @deck_selected = 21
   elsif number == 9
     @deck_selected = 24
   elsif number == 10
     @deck_selected = 27
   else
     puts "Invalid selection"
   end
 end
end
