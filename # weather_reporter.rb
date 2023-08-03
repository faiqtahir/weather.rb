# weather_reporter.rb
require 'date'

class WeatherReporter
  def self.display_extremes(year, highest, lowest, humid)
    puts "Highest: #{highest[:temperature]}C on #{highest[0].strftime('%B %d')}"
    puts "Lowest: #{lowest[:temperature]}C on #{lowest[0].strftime('%B %d')}"
    puts "Humid: #{humid[:humidity]}% on #{humid[0].strftime('%B %d')}"
  end

  def self.display_monthly_averages(year_month, highest_avg, lowest_avg, humidity_avg)
    puts "Highest Average: #{highest_avg.round(1)}C"
    puts "Lowest Average: #{lowest_avg.round(1)}C"
    puts "Average Humidity: #{humidity_avg.round(1)}%"
  end

  def self.draw_temperature_chart(weather_data, month)
    matching_dates = weather_data.matching_dates(month)
    return if matching_dates.empty?

    puts "#{Date::MONTHNAMES[month]} #{matching_dates.keys.first.year}"

    matching_dates.each do |date, data|
      highest_temp = data[:temperature]
      lowest_temp = data[:temperature]
      highest_temp_color = "\e[41m"
      lowest_temp_color = "\e[44m"

      (date - date.at_beginning_of_month).to_i.times do
        print '  '
      end

      print "#{date.day} "

      highest_temp.times do
        print highest_temp_color + '+' + "\e[0m"
      end

      print " #{highest_temp}C - "

      lowest_temp.times do
        print lowest_temp_color + '+' + "\e[0m"
      end

      puts " #{lowest_temp}C"
    end
  end
end
