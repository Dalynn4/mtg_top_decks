class Decks
  attr_accessor :deck_selected, :event_date_selected

def initialize(deck_selected, event_date_selected)
  set_deck_selected(deck_selected)
  set_event_date_selected(event_date_selected)
  @array_of_deck_urls = []
end

 def show_decklist_standard
  standard = Nokogiri::HTML(open("https://www.mtggoldfish.com/metagame/standard"))
  standardevent = Nokogiri::HTML(open("https://www.mtggoldfish.com#{standard.css(".decks-sidebar h4 a")[@event_date_selected]["href"]}"))

  standardevent.css(".tournament-decklist-odd  td a").each do |url|
      @array_of_deck_urls << url["href"]
   end
  standardevent.css(".tournament-decklist-event  td a").each do |url|
      @array_of_deck_urls << url["href"]
  end

  currentdeckselection = Nokogiri::HTML(open("https://www.mtggoldfish.com#{@array_of_deck_urls[@deck_selected]}"))
  deckformat = currentdeckselection.css(".deck-col-qty,.deck-col-card").collect do |card|
      card.text.strip
   end

  counter = 0
  while counter < deckformat.length
    puts "#{deckformat[counter]} #{deckformat[counter + 1]}"
    counter += 2
  end
 end

 def show_decklist_modern
  modern = Nokogiri::HTML(open("https://www.mtggoldfish.com/metagame/modern"))
  modernevent = Nokogiri::HTML(open("https://www.mtggoldfish.com#{modern.css(".decks-sidebar h4 a")[@event_date_selected]["href"]}"))

  modernevent.css(".tournament-decklist-odd  td a").each do |url|
      @array_of_deck_urls << url["href"]
   end
  modernevent.css(".tournament-decklist-event  td a").each do |url|
      @array_of_deck_urls << url["href"]
  end

  currentdeckselection = Nokogiri::HTML(open("https://www.mtggoldfish.com#{@array_of_deck_urls[@deck_selected]}"))
  deckformat = currentdeckselection.css(".deck-col-qty,.deck-col-card").collect do |card|
      card.text.strip
   end

  counter = 0
  while counter < deckformat.length
    puts "#{deckformat[counter]} #{deckformat[counter + 1]}"
    counter += 2
  end
end

def show_decklist_legacy
 legacy = Nokogiri::HTML(open("https://www.mtggoldfish.com/metagame/legacy"))
 legacyevent = Nokogiri::HTML(open("https://www.mtggoldfish.com#{legacy.css(".decks-sidebar h4 a")[@event_date_selected]["href"]}"))

 legacyevent.css(".tournament-decklist-odd  td a").each do |url|
     @array_of_deck_urls << url["href"]
  end
 legacyevent.css(".tournament-decklist-event  td a").each do |url|
     @array_of_deck_urls << url["href"]
 end

 currentdeckselection = Nokogiri::HTML(open("https://www.mtggoldfish.com#{@array_of_deck_urls[@deck_selected]}"))
 deckformat = currentdeckselection.css(".deck-col-qty,.deck-col-card").collect do |card|
     card.text.strip
  end

 counter = 0
 while counter < deckformat.length
   puts "#{deckformat[counter]} #{deckformat[counter + 1]}"
   counter += 2
 end
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
