require_relative 'parser.rb'
require_relative 'saver.rb'


class MainApplication
  def initialize
    @parser = Parser.new
    @saver = Saver.new
  end

  def run()
    categories = @parser.get_categories
    @saver.save_to_json('data/categories.json', categories)
    puts 'All categories are saved!!!'
  end
end


main = MainApplication.new
main.run
