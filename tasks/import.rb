require 'csv'
require 'open-uri'

class Import
  def fetch_csv
    begin
      open('http://earthquake.usgs.gov/earthquakes/catalogs/eqs7day-M1.txt')
    rescue OpenURI::HTTPError => e
      puts "Whoops got a bad status code #{e.message}"
    end
  end

  def create_rows
    csv_text = fetch_csv
    CSV.foreach(csv_text, :headers => true) do |row|
        begin
          Earthquake.create!(
          :source => row[0],
          :eqid => row[1],
          :version => row[2],
          :datetime => row[3],
          :latitude => row[4],
          :longitude => row[5],
          :magnitude => row[6],
          :depth => row[7],
          :nst => row[8],
          :region => row[9]
        )
        rescue ActiveRecord::RecordInvalid => e
          if e.message == 'Validation failed: Eqid has already been taken'
            next
          end
        end
    end
  end
end
