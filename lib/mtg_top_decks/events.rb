class Events
  include Urls
attr_accessor :event_date_selected, :standard, :standard_event, :modern, :modern_event, :legacy, :legacy_event

 def initialize(number_selected)
   @event_date_selected = (number_selected * 2) - 1
   @array_of_decks = []
 end


 def standard_events
   standard_url
   standard_event_url
   self.scrape_event(@standardevent)
   self.list
 end

 def modern_events
   modern_url
   modern_event_url
   self.scrape_event(@modernevent)
   self.list
 end

 def legacy_events
   legacy_url
   legacy_event_url
   self.scrape_event(@legacyevent)
   self.list
 end

def list
  counter = 3
  counter2 = 1
   @array_of_decks.each do |deck|
     if counter % 3 == 0
       puts "#{counter2}. #{deck}"
       counter2 += 1
     end
     counter +=1
   end
end

def scrape_event(event)
  event.css(".tournament-decklist-odd  td a").each do |deck|
    @array_of_decks << deck.text
  end
  event.css(".tournament-decklist-event  td a").each do |deck|
    @array_of_decks << deck.text
  end
end
end
