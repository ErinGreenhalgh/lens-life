module DateFormatter

  def format_since_date(date, weeks_to_subtract)
    new_date = date - ((7 * (weeks_to_subtract)) * seconds_per_day)
    new_date.strftime("%Y-%m-%dT%H:%M:%SZ")
  end

  def seconds_per_day
    (24 * 60 * 60)
  end
end
