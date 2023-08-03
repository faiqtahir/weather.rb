# weather_analyzer.rb
class WeatherAnalyzer
  def self.find_extremes(weather_data)
    highest_temp = weather_data.data.max_by { |_date, data| data[:temperature] }
    lowest_temp = weather_data.data.min_by { |_date, data| data[:temperature] }
    most_humid = weather_data.data.max_by { |_date, data| data[:humidity] }

    [highest_temp, lowest_temp, most_humid]
  end

  def self.calculate_monthly_averages(weather_data, month)
    matching_dates = weather_data.matching_dates(month)
    return nil if matching_dates.empty?

    num_days = matching_dates.size
    total_highest_temp = matching_dates.values.sum { |data| data[:temperature] }
    total_lowest_temp = matching_dates.values.sum { |data| data[:temperature] }
    total_humidity = matching_dates.values.sum { |data| data[:humidity] }

    average_highest_temp = total_highest_temp / num_days
    average_lowest_temp = total_lowest_temp / num_days
    average_humidity = total_humidity / num_days

    [average_highest_temp, average_lowest_temp, average_humidity]
  end
end
