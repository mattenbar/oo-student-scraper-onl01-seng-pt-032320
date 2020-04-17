require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students_array = []
    doc = Nokogiri::HTML(open(index_url))
    doc.css(".student-card").each do |student|
      student_info = {}
      student_info[:name] = student.css("h4.student-name").text
      student_info[:location] = student.css("p.student-location").text
      student_info[:profile_url] = student.css("a").attribute("href").text
      students_array << student_info
    end
    students_array
  end

  def self.scrape_profile_page(profile_url)
    student_profile = {}
    doc = Nokogiri::HTML(open(profile_url))
    student_profile[:bio] = doc.css(".description-holder p").text
    student_profile[:blog]
    student_profile[:github]
    student_profile[:lindedin]
    student_profile[:profile_quote]
    student_profile[:twitter]

    student_profile
  end

end
