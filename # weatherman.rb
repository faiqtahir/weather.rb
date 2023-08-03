# weatherman.rb
require_relative 'weather_data'
require_relative 'weather_analyzer'
require_relative 'weather_reporter'

class Weatherman
  def self.main(args)
    if args[0] == '-e'
      # ... (same code as before)
    elsif args[0] == '-a'
      # ... (same code as before)
    elsif args[0] == '-c'
      # ... (same code as before)
    else
      puts 'Invalid option. Usage: ruby weatherman.rb [OPTION] ARGUMENT /path/to/filesFolder'
      puts 'Options:'
      puts '  -e YEAR           Display extremes for a given year'
      puts '  -a YEAR/MONTH     Display averages for a given month'
      puts '  -c YEAR/MONTH     Draw horizontal bar charts for a given month'
    end
  end
end

if ARGV.length < 3
  puts 'Usage: ruby weatherman.rb [OPTION] ARGUMENT /path/to/filesFolder'
  puts 'For help, use: ruby weatherman.rb --help'
else
  Weatherman.main(ARGV)
end
