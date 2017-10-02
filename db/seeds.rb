require 'httparty'
require 'nokogiri'


page = HTTParty.get('https://council.nyc.gov/districts/')
council_members = []

parse_page = Nokogiri::HTML(page)



parse_page.css('tr').map do |row|
    id = row.css('.button.small.expanded strong').text
    name = row.css('.sort-member strong').text
    link = row.css('.sort-member a').attr('href').text
    image = row.css('img').attr('src').text
    borough = row.css('.sort-borough').text
    party = row.css('.sort-party').text
    neighborhoods = row.css('.sort-neighborhoods.neighborhoods').text

    council_members << CouncilMember.create(name: name, link: link,  image: image, borough: borough, party: party, neighborhoods: neighborhoods)
end 