import { combineReducers } from 'redux';
import * as types from '../constants/action-types';
import {_} from 'lodash';
import * as fuzzy from 'fuzzy';

export var events = (state = {}, action) => {
  return state;
};

export var filteredEvents = (state = {}, action) => {
  if(action.type == types.FILTER_EVENTS) {
    const list = _.map(action.data.events, 'name');
    const filteredList = fuzzy.filter(action.data.filter, list);
    const indexes = _.map(filteredList, 'index');
    const copyEvents = Object.assign([], action.data.events);
    const filteredEvents = _.pullAt(copyEvents, indexes);
    console.log(filteredEvents)
    return filteredEvents;
  }
  return state;
};

export default combineReducers({
  events,
  filteredEvents
});
