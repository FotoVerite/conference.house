import * as types from '../constants/action-types';

export function filterEvents(data) {
  return {
    type: types.FILTER_EVENTS,
    data
  };
}