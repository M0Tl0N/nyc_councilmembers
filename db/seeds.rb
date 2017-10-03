require 'httparty'
require 'nokogiri'


page = HTTParty.get('https://council.nyc.gov/districts/')
council_members = []
participating_members = [3, 5, 6, 7, 8, 10, 11, 15, 16, 17, 19, 21, 22, 23, 26, 27, 29, 30, 31, 32, 33, 34, 35, 36, 38, 39, 40, 44, 45, 47, 49]

parse_page = Nokogiri::HTML(page)



parse_page.css('tr').map do |row|
    id = row.css('.button.small.expanded strong').text
    name = row.css('.sort-member strong').text
    link = row.css('.sort-member a').attr('href').text
    image = row.css('img').attr('src').text
    borough = row.css('.sort-borough').text
    party = row.css('.sort-party').text
    neighborhoods = row.css('.sort-neighborhoods.neighborhoods').text
    participating = false

    if participating_members.include?(id.to_i)
        participating = true 
    else 
        participating = false
    end 



    council_members << CouncilMember.create(name: name, link: link,  image: image, borough: borough, party: party, neighborhoods: neighborhoods, participating?: participating)
end 