require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './student.rb'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    doc.css(".roster-cards-container").each do |student_card|
      student_card.css(".student-card").each do |student|
        "#{student.attribute('href')}"
      end
    end


    #binding.pry
  end

  def self.scrape_profile_page(profile_url)

  end

end
