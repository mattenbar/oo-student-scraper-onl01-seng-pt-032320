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
    student_profile[:profile_quote] = doc.css("div.main-wrapper.profile .vitals-text-container .profile-quote").text

    doc.css(".social-icon-container").each do |social_icon|
      if social_icon.attribute("href").value.include?("github")
        student_profile[:github] =social_icon.attribute("href").text
      elsif social_icon.attribute("href").value.include?("lindedin")
        student_profile[:lindedin] = social_icon.attribute("href").text
      elsif social_icon.attribute("href").value.include?("twitter")
        student_profile[:twitter] = social_icon.attribute("href").text
      else
        student_profile[:blog] = social_icon.attribute("href").text
      end
    end
    student_profile
  end

end
