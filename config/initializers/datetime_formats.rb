Time::DATE_FORMATS[:default] = "%m-%d-%Y %H:%M %z"
Date::DATE_FORMATS[:default] = "%Y-%m-%d"

Time::DATE_FORMATS[:month_day_year_hour_min_zone] = "%m-%d-%Y %H:%M %Z"
Date::DATE_FORMATS[:month_day_year_hour_min_zone] = "%m-%d-%Y"

Time::DATE_FORMATS[:month_day_year_12_hour] = "%m-%d-%Y %I:%M%p"
Date::DATE_FORMATS[:month_day_year_12_hour] = "%m-%d-%Y"

Time::DATE_FORMATS[:month_day_year] = "%m-%d-%Y"
Date::DATE_FORMATS[:month_day_year] = "%m-%d-%Y"

Time::DATE_FORMATS[:mark_zeros] = "*%m/*%d/%Y *%I:%M %p %Z"
Date::DATE_FORMATS[:mark_zeros] = "*%m/*%d/%Y"

Time::DATE_FORMATS[:monthname_day] = "%B %-1d"
Date::DATE_FORMATS[:monthname_day] = "%B %-1d"

Time::DATE_FORMATS[:monthname_year] = "%B %Y"
Date::DATE_FORMATS[:monthname_year] = "%B %Y"

Time::DATE_FORMATS[:cc_exp] = "%m/%y"
Date::DATE_FORMATS[:cc_exp] = "%m/%y"

Range::RANGE_FORMATS[:date_span] = lambda do |s, e|
  if s.year != e.year
    # longest format: Dec 31, 2008-Jan 2, 2009
    s.strftime("%B %-1d, %Y") << "-" << e.strftime("%B %-1d, %Y")
  elsif s.month != e.month
    # medium format: Jan 31-Feb 2, 2008 (start omits year)
    s.strftime("%B %-1d") << "-" << e.strftime("%B %-1d, %Y")
  elsif s.day != e.day
    # short format: Jan 1-2, 2008 (start omits year + end omits month)
    s.strftime("%B %-1d") << "-" << e.strftime("%-1d, %Y")
  else
    # single date: Jan 1, 2008 (start omits year + end omits month & day)
    s.strftime("%B %-1d, %Y")
  end
end

Range::RANGE_FORMATS[:date_span_short] = Proc.new do |s, e|
  if s.year != e.year
    # longest format: Dec 31, 2008-Jan 2, 2009
    s.strftime("%-1m/%-1d/%Y") << "-" << e.strftime("%-1m/%-1d/%Y")
  elsif s.month != e.month
    # medium format: Jan 31-Feb 2, 2008 (start omits year)
    s.strftime("%-1m/%-1d") << "-" << e.strftime("%-1m/%-1d/%Y")
  elsif s.day != e.day
    # short format: Jan 1-2, 2008 (start omits year + end omits month)
    s.strftime("%-1m/%-1d") << "-" << e.strftime("%-1d/%Y")
  else
    # single date: Jan 1, 2008 (start omits year + end omits month & day)
    s.strftime("%-1m/%-1d/%Y")
  end
end