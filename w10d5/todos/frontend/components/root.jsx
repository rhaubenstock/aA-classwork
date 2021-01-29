import React from 'react';
import { Provider } from 'react-redux';
import App from './app';

function Root({ store }){
  return (
    <Provider store={store}>
      <App />
    </Provider>
  )
};

export default Root;