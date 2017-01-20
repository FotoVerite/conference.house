import React, { PropTypes } from 'react';
import { Provider } from 'react-redux';
import Events from './events';
import createStore from '../stores/events-provider';


const EventsProvider = React.createClass({
  propTypes: {
    events: PropTypes.array.isRequired,
    filteredEvents: PropTypes.array.isRequired,
    currentUser: PropTypes.object
  },

  componentWillMount() {
    const store = createStore(this.props);
    this.setState({store});
  },

  render() {
    return (
      <Provider store={this.state.store}>
        <Events />
      </Provider>
    );
  }
});

export default EventsProvider;
