require 'open-uri'
require 'nokogiri'

class Parser
  def initialize
    @base_url = 'https://rozetka.com.ua/ua/'
  end

  def get_category_children(url)
    html = Nokogiri::HTML(URI.open(url))
    categories = html.css('ul.portal-grid li.portal-grid__cell')
    return categories.map do |category| {
      'title': category.css('a').text,
      'href': category.css('a')[0]['href'],
      'children': category.css('ul.tile-cats__list li.tile-cats__item').map{|item| {
        'title': item.css('a').text,
        'href': item.css('a')[0]['href'],
        'children': []
      }}
    }
    end
  end

  def get_categories()
    puts '----------Start to parse Rozetka categories------------'
    html = Nokogiri::HTML(URI.open(@base_url))
    categories = html.css('ul.menu-categories li.menu-categories__item')
    return categories.map do |category| {
      'title': category.css('a').text,
      'href': category.css('a')[0]['href'],
      children: get_category_children(category.css('a')[0]['href'])
    }
    end
  end
end
