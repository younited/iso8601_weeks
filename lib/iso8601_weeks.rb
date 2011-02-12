module Iso8601Weeks

  def self.iso_8601_week_and_year_for_time(time)
    week =  time.strftime("%V").to_i
    month = time.strftime("%m").to_i
    year = time.strftime("%Y").to_i
    if week > 51 && month == 1
      [year - 1, week]
    elsif week == 1 && month == 12
      [year + 1, week]
    else
      [year, week]
    end
  end

  def self.time_from_iso_8601_week_and_year(week, year)
    unless [1..53].include? week
      raise
    end

    if week > 51
      last_day_of_year = Time.utc(year, 12, 31)
      if week == last_day_of_year.strftime("%V").to_i       # 53 == 52 will never happen
        last_day_of_year.at_beginning_of_week
      else                                                  # 52 != 53
        last_day_of_year.at_beginning_of_week - 1.week
      end
    else
      first_day_of_year = Time.utc(year)
      if first_day_of_year.wday < 5
        first_day_of_year.at_beginning_of_week + (week - 1).weeks
      else
        first_day_of_year.at_beginning_of_week + (week).weeks
      end
    end
  end

end