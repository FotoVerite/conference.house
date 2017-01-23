
import React, { PropTypes } from 'react';

export default function Event({event}) {

  Event.propTypes = {
    event: PropTypes.object.isRequired
  };

  return (
    <div className="row list-group-item">
      <div className="col-sm-4">
        <b>{ event.name }</b> &nbsp;
        <time dateTime={"${event.start_date}/${event.end_date}"}>
          {event.date_span_attribute}
        </time>
        <br/>
        <p><a href={`http://${event.website}`}>{ event.website }</a></p>
      </div>
      <address className="col-sm-4"dangerouslySetInnerHTML={{__html: event.address}}>
      </address>
      <div className="col-sm-4">
        <p dangerouslySetInnerHTML={{__html: event.listing_url}}></p>
        <p>looking for a room: { event.lfr_count }</p>
        <p>I have a  room: { event.hr_count }</p>
      </div>
      <br />
    </div>
  );
}