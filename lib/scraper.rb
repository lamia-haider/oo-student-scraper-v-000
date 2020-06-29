require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(url)
    scraped_students = []
    d = Nokogiri::HTML(open(url))
    d.css('.student-card').collect do |sc|
      student_name = sc.css('.student-name').text
      student_location = sc.css('.student-location').text
      student_profile_link = sc.css('a').attr('href').value
      scraped_students << {name: student_name, location: student_location, profile_url: student_profile_link}

    # binding.pry
    end
    scraped_students
  end

end





#
# class Scraper
#   def self.scrape_index_page(index_url)
#     students = []
#     html = open("./fixtures/student-site/index.html")
#     doc = Nokogiri::HTML(html)
#     doc.css(".student-card").each do |scard|
#       name = scard.css("h4.student-name").text
#       location = scard.css("p.student-location").text
#       url = scard.css("a").attribute("href").value
#       students << {:name => name, :location => location, :profile_url => url}
#     end
#     students
#   end
#
#   def self.scrape_profile_page(profile_url)
#     html = open(profile_url)
#     doc = Nokogiri::HTML(html)
#     student = {}
#     sites = doc.css(".social-icon-container a").collect {|sic| sic.attribute("href").value}
#     sites.each do |url|
#       if url.include?("twitter")
#         student[:twitter] = url
#       elsif url.include?("linkedin")
#         student[:linkedin] = url
#       elsif url.include?("github")
#         student[:github] = url
#       else student[:blog] = url
#       end
#       student[:profile_quote] = doc.css(".profile-quote").text
#       student[:bio] = doc.css(".bio-block .bio-content .description-holder p").text
#
#     end
#     student
#
#   end
#
# end
