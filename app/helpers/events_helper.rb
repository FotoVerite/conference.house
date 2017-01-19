module EventsHelper

  def date_span(start_date, end_date, format=:date_span_short)
    (start_date..end_date).to_s(format)
  end

  def address_string(event)
    [
      event.venue_name,
      event.country,
      "#{event.state} #{event.city}".chomp,
      "#{event.street_address} #{event.postal_code}".chomp
    ].compact.join("<br />\n").html_safe
  end

end
