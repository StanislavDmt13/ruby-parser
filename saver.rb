require 'csv'
require 'json'

class Saver

  def save_to_csv(filename, data)
      CSV.open(file, "w", :write_headers => true, :col_sep => "---", :headers => ["Book title", "Author", "Description", "Price"]) do |csv|
        data.each{ |i|
          csv << i.values
        }
      end
  end

  def save_to_json(filename, data)
    File.open(filename, "w") { |f| f.puts data.to_json }
  end

end
