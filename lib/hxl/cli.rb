require 'thor'

class HXL::CLI < Thor
  desc "convert <input.csv> <output.csv>", "Convert your spreadsheets to HXL"
  long_desc <<-LONGDESC
    `hxl convert` will convert a HXL encoded CSV to a standard HXL formatted CSV. This includes compact disaggregation.

    The first parameter specifies the input CSV and the second file specifies the output CSV

  LONGDESC

  def convert(input, output=nil)
    if output.nil?
      output = input.split('.')
        .insert(-2, 'hxl')
        .join('.')
    end

    HXL.open(output, 'wb') do |csv|
      headers = false
      HXL.foreach(input) do |row|
        unless headers
          csv << row.headers
          headers = true
        end
        csv << row
      end
    end
  end

end
