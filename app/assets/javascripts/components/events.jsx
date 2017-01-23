import React, { PropTypes } from 'react';
import { connect } from 'react-redux';
import Event from './event';
import * as eventsActions from '../actions/events';
var Typeahead = require('react-typeahead').Typeahead;
import _ from 'lodash';

const Events = React.createClass({
  propTypes: {
    events: PropTypes.array.isRequired,
    filterEvents: PropTypes.func.isRequired,
    filteredEvents: PropTypes.array.isRequired,
    currentUser: PropTypes.object
  },

  filterEvents(event) {
    const data = {};
    data.events = this.props.events;
    data.filter = event.target.value;
    this.props.filterEvents(data);
  },

  onSelect(item) {
    const data = {};
    data.events = this.props.events;
    data.filter = item;
    this.props.filterEvents(data);
  },

  renderEvents() {
    const events = this.props.filteredEvents.map((event, index) => {
      return (<Event
        key={`event-${index}`}
        event={event}
      />);
    });
    if(events.length > 0) {
      return events;
    }
    return (
      <div className="callout-dark text-center fade-in-b">
        <h2>Can't find { this.refs.typeahead.state.entryValue }
          <br />
          <br />
          { this.props.currentUser ?
           (<a href={`/events/new?event[name]=${this.refs.typeahead.state.entryValue}`} className="btn btn-lg btn-info">Create this event!</a>) : (<p><a href="/login" className="btn btn-lg btn-info">Login</a> to create this event </p>)
         }
        </h2>
      </div>
      );
  },

  render() {
    return (<section>
      <label className="sr-only">I want a room for:</label>
      <Typeahead
        options={_.map(this.props.events, 'name')}
        maxVisible={5}
        ref="typeahead"
        className= "form-group"
        onKeyUp= {this.filterEvents}
        onOptionSelected={this.onSelect}
        placeholder= "I am looking for a room at?"
        customClasses={{
          input: 'form-control',
          results: 'list-group',
          listItem: 'list-group-item'
        }}
       />
      <div className="list-group">{this.renderEvents()}</div>
    </section>);
  }
});

const stateToProps = function(state) {
  return { events: state.events,
          filteredEvents: state.filteredEvents,
          currentUser: state.currentUser
        };
};

export default connect(stateToProps, eventsActions)(Events);