require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './student.rb'

class Scraper

  def self.scrape_index_page(index_url)
    students_array = []
    doc = Nokogiri::HTML(open(index_url))
    doc.student_card.css(".student-card").each do |student|
      student_info = {}
      student_info[:name] = student.css("h4.student-name").text
      student_info[:location] = student.css("p.student-location").text
      profile_path = student.css("a").attribute("href").value
      student_info[:profile_url] = './fixtures/student-site/' + profile_path
      students_array << student_info
    end
  end

  def self.scrape_profile_page(profile_url)

  end

end
