
import React, { PropTypes } from 'react';

export default function Event({event}) {

  Event.propTypes = {
    event: PropTypes.object.isRequired
  };

  return (
    <div className="row list-group-item">
      <div className="col-sm-4">
        { event.name }
        <time dateTime={"${event.start_date}/${event.end_date}"}>
          {event.date_span_attribute}
        </time>
        <br/>
        <a href={`/${event.website}`}>{ event.website }</a>
      </div>
      <div className="col-sm-4"dangerouslySetInnerHTML={{__html: event.address}}>
      </div>
      <div className="col-sm-4">
        <p dangerouslySetInnerHTML={{__html: event.listing_url}}></p>
        <p>lfr: { event.lfr_count }</p>
        <p> hr: { event.hr_count }</p>
      </div>
      <br />
    </div>
  );
}