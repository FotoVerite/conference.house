// Polyfills for older browsers

// used by almost everything redux
import 'core-js/fn/object/assign';

// 3rd party library code
import React from 'react';
import ReactDOM from 'react-dom';

// Our classes
import EventsProvider from './components/events-provider';

// React Component Loader
const componentsToRender = window.reactComponents || [];

const compnents = window.compnents =  {
  EventsProvider,
};

componentsToRender.forEach(([name, props, node]) => {
  ReactDOM.render(React.createElement(compnents[name], props), node);
});
