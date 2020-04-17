require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

require_relative './student.rb'

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))

    #student names - doc.css(".student-name").text
    #student locations - doc.css(".student-location").text
    #student URL -
    binding.pry
  end

  def self.scrape_profile_page(profile_url)

  end

end
