class MetagameScraper



def standardscraper
  standard = Nokogiri::HTML(open("https://www.mtggoldfish.com/metagame/standard"))
    standard.css(".decks-sidebar h4").text
    puts standard.css(".decks-sidebar .col-deck .deck-price-paper").text

end

def modernscraper
end

def legacyscraper
end


end
