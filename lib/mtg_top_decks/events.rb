class Events
attr_accessor :event_date_selected

def initialize(number_selected)
  set_event_date_selected(number_selected)
end

 def standardevents
  standard = Nokogiri::HTML(open("https://www.mtggoldfish.com/metagame/standard"))
  standardevent = Nokogiri::HTML(open("https://www.mtggoldfish.com#{standard.css(".decks-sidebar h4 a")[@event_date_selected]["href"]}"))
  #standard.css(".decks-sidebar .col-deck .deck-price-paper").text
  #tandard.css(".decks-sidebar .col-w").text
  #standard.css(".decks-sidebar .col-l").text
  #standard.css(".decks-sidebar h4 a")[1]["href"]
  puts "https://www.mtggoldfish.com#{standard.css(".decks-sidebar h4 a")[@event_date_selected]["href"]}"#standardevent.css#(".tournament-decklist-odd a").text

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

end
