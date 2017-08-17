class MetagameScraper
  include Urls
  attr_accessor :standard, :modern, :legacy

  def standard_scraper
    standard_url
    self.get_events(@standard)
  end

  def modern_scraper
    modern_url
    self.get_events(@modern)
  end

  def legacy_scraper
    legacy_url
    self.get_events(@legacy)
  end

  def get_events(metagame)
    counter = 1
    metagame.css(".decks-sidebar h4").each do |event|
      puts "#{counter}. #{event.text.strip}"
      counter += 1
    end
  end
end
