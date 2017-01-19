import { createStore, compose } from 'redux';
import eventReducer from '../reducers/events';

const configureStore = initialState => {
  // take the order items off of the order so we can separate out the reducers
  return createStore(eventReducer, {
    ...initialState,
  }, compose(
    // enable dev tools
    window.devToolsExtension ? window.devToolsExtension() : f => f
  ));
};

export default configureStore;
