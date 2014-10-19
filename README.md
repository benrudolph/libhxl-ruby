libhxl-ruby
=============

Ruby support library for the Humanitarian Exchange Language (HXL) data standard.

# Installation

`gem install libhxl-ruby`

# Usage

Read a HXL file from a csv, row by row:

```
require 'libhxl-ruby'

HXLReader.foreach('path/to/csv').foreach do |row|
  p "Row " + str(row.row_number)
  row.each do |key, value|
    p "#{key} = #{value.value}"
  end
end
```