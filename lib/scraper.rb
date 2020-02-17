class Scraper 
  def scrape_list(zip_code)
    doc = Nokogiri::HTML(open("https://www.restaurant.com/listing/?zip=#{zip_code}"))
    doc.css(".restaurants").each do |ct|
      name = ct.css("h3").first.content.strip
      details = ct.css("p").first.content

      Restaurant.new(name, details)
    end

    # puts Restaurant.restaurants.length
  end
end