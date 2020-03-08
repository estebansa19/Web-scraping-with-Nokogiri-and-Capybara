class HotelsSpider < Kimurai::Base
  @name = 'hotels_spider'
  @engine = :mechanize

  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end

  def parse(response, url:, data: {})
    response.xpath("//div[@class='card hotel-card']").each do |hotel|
      item = {}

      item[:name] = hotel.css('span.hotel-name').text
      item[:reviews_score] = hotel.css('div.button-reviews span')[1].text.split('/')[0].to_f
      item[:actual_rate] = hotel.css('span.current_rate').text.tr('$.', '').squish.to_i
      item[:last_rate] = hotel.css('span.last_rate').text.tr('$.', '').squish.to_i
      item[:city_name] = response.css('h1.city-title').text.squish.gsub('HOTELES EN ', '').parameterize

      Hotel.where(item).first_or_create
    end
  end
end