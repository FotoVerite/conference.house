module EventsHelper

  def date_span(start_date, end_date, format=:date_span_short)
    (start_date..end_date).to_s(format)
  end

  def address_string(event)
    "#{event.country}<br />
    #{event.state} #{event.city}<br />
    #{event.street_address} #{event.postal_code}".html_safe
  end

end
