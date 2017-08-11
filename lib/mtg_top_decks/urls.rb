module Urls

  def standard_url
   @standard = Nokogiri::HTML(open("https://www.mtggoldfish.com/metagame/standard"))
  end

  def standard_event_url
   @standardevent = Nokogiri::HTML(open("https://www.mtggoldfish.com#{@standard.css(".decks-sidebar h4 a")[@event_date_selected]["href"]}"))
  end

  def modern_url
   @modern = Nokogiri::HTML(open("https://www.mtggoldfish.com/metagame/modern"))
  end

  def modern_event_url
   @modernevent = Nokogiri::HTML(open("https://www.mtggoldfish.com#{@modern.css(".decks-sidebar h4 a")[@event_date_selected]["href"]}"))
  end

  def legacy_url
   @legacy = Nokogiri::HTML(open("https://www.mtggoldfish.com/metagame/legacy"))
  end

  def legacy_event_url
   @legacyevent = Nokogiri::HTML(open("https://www.mtggoldfish.com#{@legacy.css(".decks-sidebar h4 a")[@event_date_selected]["href"]}"))
  end
end
